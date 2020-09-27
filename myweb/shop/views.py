from django.shortcuts import render
from shop.models import Product,Cart
from django.shortcuts import redirect

def product_list(request):
    #상품 갯수
    count=Product.objects.count()
    #상품이름으로 오름차순 정렬한 상품리스트
    productList=Product.objects.order_by('product_name')
    #상품목록 페이지로 이동하여 출력
    return render(request, 'shop/product_list.html',
                  {'productList':productList, 'count':count})

def product_write(request):
    #세션 변수 userid가 존재하면 상품등록 페이지로 이동
    if request.session.get('userid',False):
        return render(request, 'shop/product_write.html')
    else: #세션변수가 없으면 로그인 페이지로 이동
        return redirect('/member/login')

from django.views.decorators.csrf import csrf_exempt
UPLOAD_DIR='d:/python/myweb/shop/static/images/'
@csrf_exempt
def product_insert(request):
    if 'file1' in request.FILES: #첨부파일이 존재하면
        file=request.FILES['file1'] #첨부파일 정보
        file_name=file._name #첨부파일의 이름
        fp = open('%s%s' % (UPLOAD_DIR, file_name), 'wb') #파일 오픈
        for chunk in file.chunks():
            fp.write(chunk) #파일 저장
        fp.close() # 파일 참조변수 닫기
    else:
        file_name='_'
    row=Product(product_name=request.POST['product_name'],
                price=request.POST['price'],
                description=request.POST['description'],
                picture_url=file_name)
    row.save() #레코드가 저장됨
    return redirect('/shop/product_list') #상품목록 화면으로 이동

#상품상세정보 페이지로 이동
def product_detail(request):
    pid=request.GET['product_id'] #상품코드
    row=Product.objects.get(product_id=pid) #상품 레코드 선택
    # 상품상세정보 페이지가 출력됨
    return render(request, 'shop/product_detail.html',{'row':row,
                                                       'range':range(1,21)})

#상품수정페이지로 이동
def product_edit(request):
    if request.session.get('userid',False): #로그인한 상태이면
        pid=request.GET['product_id'] #클릭한 상품코드
        row=Product.objects.get(product_id=pid) #상품선택
        #상품수정 페이지로 이동
        return render(request, 'shop/product_edit.html',{'row':row})
    else: #로그인하지 않은 상태이면
        return redirect('/member/login') #로그인 페이지로 이동

@csrf_exempt
def product_update(request):
    id=request.POST['product_id'] #상품 코드
    row_src=Product.objects.get(product_id=id)
    p_url=row_src.picture_url #수정 전 상품이미지
    if 'file1' in request.FILES:
        file = request.FILES['file1']
        p_url= file._name #첨부파일 이름
        fp = open('%s%s' % (UPLOAD_DIR, p_url), 'wb')
        for chunk in file.chunks():
            fp.write(chunk)
        fp.close()

    row_new = Product(product_id=id,
                      product_name=request.POST['product_name'],
                      price=request.POST['price'],
                      description=request.POST['description'],
                      picture_url=p_url)
    row_new.save()
    return redirect('/shop/product_list')

@csrf_exempt #크로스 사이트 스크립팅 공격 방지 코드
def product_delete(request):
    #request.POST['product_id'] 삭제할 상품 코드
    #상품이 삭제됨
    Product.objects.get(product_id=request.POST['product_id']).delete()
    #상품목록으로 이동
    return redirect('/shop/product_list')

@csrf_exempt
def cart_insert(request):
    uid=request.session.get('userid','') #로그인한 사용자의 아이디
    if uid !='': #로그인 한 상태이면
        #장바구니 레코드 정보
        row=Cart(userid=uid, product_id=request.POST['product_id'],
                 amount=request.POST['amount'])
        row.save() #저장
        #장바구니 목록으로 이동
        return redirect('/shop/cart_list')
    else: #로그인하지 않은 사태이면 로그인 페이지로 이동
        return redirect('/member/login')

def cart_list(request):
    uid=request.session.get('userid','') #세션 체크
    if uid !='': #로그인한 상태
        cartCount = Cart.objects.filter(userid=uid).count() #장바구니 레코드 갯수
        cartList = Cart.objects.raw('''
        select cart_id, userid, amount, c.product_id, product_name,
        price, amount*price money
        from shop_cart c, shop_product p
        where c.product_id=p.product_id and userid='{0}' 
        '''.format(uid))
        sumMoney = 0 #상품합계 가격
        fee = 0 #배송료
        sum = 0 #총금액=상품합계가격+배송료
        if cartCount >0:
            sumRow=Cart.objects.raw("""
            select sum(amount*price) cart_id 
            from shop_cart c,shop_product p
            where c.product_id=p.product_id and userid='{0}'
            """.format(uid))
            sumMoney = sumRow[0].cart_id
            if sumMoney != None and sumMoney > 50000:
                fee=0 #장바구니 금액 합계가 5만원 초과 배송료 면제
            else:
                fee=2500
            if sumMoney != None:
                sum = sumMoney + fee #총합계
            else:
                sumMoney = 0
                sum = 0

        return render(request, 'shop/cart_list.html',
            {"cartList":cartList, "cartCount":cartCount,
             "sumMoney":sumMoney, "fee":fee, "sum":sum})
    else:
        return redirect('/shop/login')
#장바구니 수정 함수
@csrf_exempt
def cart_update(request):
    uid=request.session.get('userid','') #로그인한 사용자의 아이디
    if uid != '': #로그인 상태
        amt=request.POST.getlist('amount') #수량 리스트
        cid=request.POST.getlist('cart_id') #장바구니 코드 리스트
        pid=request.POST.getlist('product_id') #상품코드 리스트
        for idx in range(len(cid)):
            row=Cart(cart_id=cid[idx],userid=uid,
                     product_id=pid[idx],amount=amt[idx])
            row.save() #레코드 수정
        return redirect('/shop/cart_list') #장바구니 목록으로 이동
    else: #로그인 페이지로 이동
        return redirect('/member/login')

#장바구니 개별 삭제
def cart_del(request):
    #장바구니 코드 조회 후 삭제
    Cart.objects.get(cart_id=request.GET['cart_id']).delete()
    # 장바구니 목록으로 이동
    return redirect('/shop/cart_list')

@csrf_exempt
def cart_del_all(request):
    uid=request.session.get('userid','') #로그인한 사용자의 아이디
    if uid != '': #로그인한 상태이면
        #현재 로그인중인 사용자의 장바구니 레코드들을 모두 삭제
        Cart.objects.filter(userid=uid).delete()
        #장바구니 목록으로 이동
        return redirect('/shop/cart_list')
    else: #로그인 페이지로 이동
        return redirect('/member/login')
# Generated by Django 2.1.5 on 2020-01-07 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('survey', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='survey',
            name='ans3',
            field=models.TextField(default='', null=True),
        ),
        migrations.AlterField(
            model_name='survey',
            name='ans4',
            field=models.TextField(default='', null=True),
        ),
    ]

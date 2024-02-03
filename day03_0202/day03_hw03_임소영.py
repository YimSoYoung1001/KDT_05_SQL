import pymysql

# 2-1
print('문제 1번')
print('=' * 40)
print('userID userName prodName addr  연락처')
print('=' * 40)

conn = pymysql.connect(host = 'localhost', user = 'root', password = '0000',
                       db = 'shoppingmall', charset = 'utf8')

cur = conn.cursor()

query = '''
select u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID
'''

cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()


print()


# 2-2
print('문제 2번')
print('=' * 40)
print('userID userName prodName addr  연락처')
print('=' * 40)


conn = pymysql.connect(host = 'localhost', user = 'root', password = '0000',
                       db = 'shoppingmall', charset = 'utf8')

cur = conn.cursor()

query = '''
select u.userID, u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID
where u.userID = 'KYM';
'''

cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()


print()


# 2-3
print('문제 3번')
print('=' * 40)
print('userID userName prodName addr  연락처')
print('=' * 40)

conn = pymysql.connect(host = 'localhost', user = 'root', password = '0000',
                       db = 'shoppingmall', charset = 'utf8')

cur = conn.cursor()

query = '''
select u.userID, u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID
order by userID;
'''

cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()



print()

# 2-4
print('문제 4번')
print('=' * 40)
print('userID userName addr')
print('=' * 40)
conn = pymysql.connect(host = 'localhost', user = 'root', password = '0000',
                       db = 'shoppingmall', charset = 'utf8')

cur = conn.cursor()

query = '''
select distinct u.userID, u.userName, u.addr
from user_table u inner join buy_table b
on u.userID = b.userID 
order by userID;
'''

cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()



print()


# 2-5

print('문제 5번')
print('=' * 40)
print('userID userName  addr  연락처')
print('=' * 40)
conn = pymysql.connect(host = 'localhost', user = 'root', password = '0000',
                       db = 'shoppingmall', charset = 'utf8')

cur = conn.cursor()

query = '''
select u.userID, u.userName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table u inner join buy_table b
on u.userID = b.userID
where u.addr in ('경북', '경남')
order by userID;
'''

cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()


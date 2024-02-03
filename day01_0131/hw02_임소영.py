# -----------------------------------------------------
# 24.01.31. 과제2 임소영
# -----------------------------------------------------

# 딕셔너리 생성 ----------------------------------------------------------

my_dict = {}
my_dict['Seoul'] =  ['South Korea', 'Asia', '9,655,000']
my_dict['Tokyo'] = ['Japan', 'Asia', '14,110,000']
my_dict['Beijing'] = ['China', 'Asia', '21,540,000']
my_dict['London'] = ['United Kingdom', 'Europe', '14,800,000']
my_dict['Berlin'] = ['Germany', 'Europe', '3,426,000']
my_dict['Mexico City'] = ['Mexico', 'America', '21,200,000']

# 값 속 인구수를 쉼표를 제거한 정수로 만드는 함수 생성하여 원본 딕셔너리 업데이트
def int_money (city):
    money = my_dict[city][2].split(',')
    money_int = int(money[0] + money[1] + money[2])
    my_dict[city] = [my_dict[city][0], my_dict[city][1], money_int]

for city in my_dict.keys():
    int_money(city)


# 각 메뉴별 함수 생성 -----------------------------------------------------
def menu1():
    num = 1
    for i in my_dict:
        print(f"[{num}] {i}: {my_dict[i]}")
        num += 1
    print('-'*50)

def menu2():
    new_list = []
    new_list = sorted(my_dict.items())
    #print(new_list)

    for i in range(len(new_list)):
        key = new_list[i][0]
        value1 = new_list[i][1][0]
        value2 = new_list[i][1][1]
        value3 = new_list[i][1][2]

        print(f"[{i+1}] {key:15}\t: {value1:15}\t{value2:15}\t{value3:,}")
    print('-' * 50)

def menu3():
    new_list = []
    new_list = sorted(my_dict.items())
    new_dict = {}

    for i in range(len(new_list)):
        key = new_list[i][0]
        value1 = new_list[i][1][0]
        value2 = new_list[i][1][1]
        value3 = new_list[i][1][2]

        # 값에서 인구를 가장 앞으로 배치시킴
        value1 = value3
        value3 = new_list[i][1][0]

        #새로운 순서로 정해진 값을 리스트에 담음
        value_list = []
        value_list.append(value1)
        value_list.append(value2)
        value_list.append(value3)

        new_dict[key] = value_list

    value_sorted_list = sorted(new_dict.values(), reverse=True)
    num = 1
    #print(value_sorted_list)

    for value in value_sorted_list:
        value0 = value[0]
        for k, v in my_dict.items():
            if v[2] == value0:
                print(f"[{num}] {k:15}:{v[2]:,}")
        num += 1

    print('-' * 50)

def menu4():
    cityname = input('출력할 도시 이름을 입력하세요: ')
    if cityname in my_dict.keys():
        value = my_dict[cityname]
        print(f"도시: {cityname}")
        print(f"국가: {value[0]:7}, 대륙: {value[1]:7}, 인구수:{value[2]:,}")
    else:
        print(f"도시이름: {cityname}은 key에 없습니다.")
    print('-' * 50)

def menu5():
    sum_Asia = 0
    sum_Europe = 0
    sum_America = 0

    for value in my_dict.values():
        if value[1] == 'Asia':
            sum_Asia += value[2]
        elif value[1] == 'Europe':
            sum_Europe += value[2]
        elif value[1] == 'America':
            sum_America += value[2]

    continent = input('대륙 이름을 입력하세요(Asia, Europe, America): ')

    for k,v in my_dict.items():
        if v[1] == continent:
            print(f"{k}: {v[2]:,}")

    if continent == 'Asia':
        print(f"Asia 전체 인구수: {sum_Asia:,}")
    elif continent == 'Europe':
        print(f"Europe 전체 인구수: {sum_Europe:,}")
    elif continent == 'America':
        print(f"America 전체 인구수: {sum_America:,}")

    print('-' * 50)

while True:
    print('-' * 50)
    print("1. 전체 데이터 출력")
    print("2. 수도 이름 오름차순 출력")
    print("3. 모든 도시의 인구수 내림차순 출력")
    print("4. 특정 도시의 정보 출력")
    print("5. 대륙별 인구수 계산 및 출력")
    print("6. 프로그램 종료")
    print('-' * 50)
    menu_num = int(input('메뉴를 입력하세요: '))


    if menu_num == 1:
        menu1()

    elif menu_num == 2:
        menu2()

    elif menu_num == 3:
        menu3()

    elif menu_num == 4:
        menu4()

    elif menu_num == 5:
        menu5()

    elif menu_num == 6:
        print('프로그램을 종료합니다.')
        break
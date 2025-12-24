import subprocess as sp
import pymysql
import pymysql.cursors

def option1(cur):
    """
    Function to get players info whose nationality belongs to England
    """
    try:
        query = "SELECT * FROM PLAYER WHERE Nationality = 'England';"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option2(cur):
    """
    Function to get Team info whose established year is 2008
    """
    try:
        query = "SELECT * FROM TEAM WHERE EstablishedYear = 2008;"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option3(cur):
    """
    Function to get stadium name whose capacity is greater than or equal to 50k
    """
    try:
        query = "SELECT StadiumName FROM STADIUM WHERE Capacity >= 50000;"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option4(cur):
    """
    Function to get Team Name whose established year is greater than 2008
    """
    try:
        query = "SELECT `Team Name`, City FROM TEAM WHERE EstablishedYear > 2008;"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option5(cur):
    """
    Function to get player name who scored highest and his score in match 2
    """
    try:
        query = "SELECT p.player_name, ps.`runs scored` AS Highest_Runs FROM PLAYER p JOIN PLAYER_STATS ps ON p.Player_ID = ps.Player_ID WHERE ps.Match_ID = 2 ORDER BY ps.`runs scored` DESC LIMIT 1;"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option6(cur):
    """
    Function to get total runs scored in all matches
    """
    try:
        query = "SELECT SUM(`Team score`) AS Total_Runs FROM MATCH_STATS;"
        cur.execute(query)
        result = cur.fetchone()
        print(result)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option7(cur):
    """
    Function to get Team info whose team name has 'kings' in it
    """
    try:
        query = "SELECT * FROM TEAM WHERE `Team Name` LIKE '%Kings%';"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option8(cur):
    """
    Function to get Player info whose name has 'arma' in it
    """
    try:
        query = "SELECT * FROM PLAYER WHERE player_name LIKE '%arma%';"
        cur.execute(query)
        results = cur.fetchall()
        for row in results:
            print(row)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option9(cur):
    """
    Function to get number of players who are suffering from Hamstring in Mumbai Indians
    """
    try:
        query = "SELECT COUNT(*) AS Hamstring_Players FROM PLAYER p JOIN INJURY i ON p.Player_ID = i.Player_ID WHERE i.Injury_type = 'Hamstring' AND p.`Team Name` = 'Mumbai Indians';"
        cur.execute(query)
        result = cur.fetchone()
        print(result)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def option10(cur):
    """
    Function to get number of teams scored above 180 in all matches
    """
    try:
        query = "SELECT COUNT(DISTINCT Team_ID) AS Teams_Scored_Above_180 FROM MATCH_STATS WHERE `Team score` > 180;"
        cur.execute(query)
        result = cur.fetchone()
        print(result)
    except Exception as e:
        print("Failed to fetch data from database")
        print(">>>>>>>>>>>>>", e)

def dispatch(ch, cur, con):
    if(ch == 1):
        option1(cur)
    elif(ch == 2):
        option2(cur)
    elif(ch == 3):
        option3(cur)
    elif(ch == 4):
        option4(cur)
    elif(ch == 5):
        option5(cur)
    elif(ch == 6):
        option6(cur)
    elif(ch == 7):
        option7(cur)
    elif(ch == 8):
        option8(cur)
    elif(ch == 9):
        option9(cur)
    elif(ch == 10):
        option10(cur)
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear', shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user=username,
                              password=password,
                              db='IPL',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. Get players info whose nationality belongs to england")
                print("2. Get Team info whose established year is 2008")
                print("3. Get stadium name whose capacity is greater than or equal to 50k")
                print("4. Get Team Name whose established year is greater than 2008")
                print("5. Get player name whose scored highest and his score in match 2")
                print("6. Get total runs scored in all matches")
                print("7. Get Team info whose team name has kings in it")
                print("8. Get Player info whose name has arma in it")
                print("9. Number of players who are suffering from Hamstring in Mumbai Indians.")
                print("10. Number of teams scored above 180 in all matches")
                
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 11:
                    exit()
                else:
                    dispatch(ch, cur, con)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")

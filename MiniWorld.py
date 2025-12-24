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

def option11(cur, con):
    """
    Function to insert into PLAYER table
    """
    try:
        row = {}
        print("Enter new player's details: ")
        row["Player_ID"] = int(input("Player ID: "))
        row["player_name"] = input("Player Name: ")
        row["Jersey_no"] = int(input("Jersey no: "))
        row["Role"] = input("Role: ")
        row["Team_Name"] = input("Team Name: ")
        row["Nationality"] = input("Nationality: ")
        row["BattingStyle"] = input("Batting Style: ")
        row["BowlingStyle"] = input("Bowling Style: ")
        row["Total_runs"] = int(input("Total runs: "))
        row["Total_wickets_taken"] = int(input("Total wickets taken: "))
        row["Matches_played"] = int(input("Matches played: "))
        row["Captain_ID"] = int(input("Captain ID: "))
        row["Team_ID"] = int(input("Team ID: "))

        query = "INSERT INTO PLAYER(Player_ID, player_name, `Jersey no`, Role, `Team Name`, Nationality, BattingStyle, BowlingStyle, `Total runs`, `Total wickets taken`, `Matches played`, Captain_ID, Team_ID) VALUES(%d, '%s', %d, '%s', '%s', '%s', '%s', '%s', %d, %d, %d, %d, %d)" % (
            row["Player_ID"], row["player_name"], row["Jersey_no"], row["Role"], row["Team_Name"], row["Nationality"], row["BattingStyle"], row["BowlingStyle"], row["Total_runs"], row["Total_wickets_taken"], row["Matches_played"], row["Captain_ID"], row["Team_ID"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def option12(cur, con):
    """
    Function to insert into INJURY table
    """
    try:
        row = {}
        print("Enter new injury details: ")
        row["INJURY_ID"] = int(input("Injury ID: "))
        row["Player_ID"] = int(input("Player ID: "))
        row["Injury_type"] = input("Injury type: ")
        row["Duration"] = int(input("Duration: "))

        query = "INSERT INTO INJURY(INJURY_ID, Player_ID, Injury_type, Duration) VALUES(%d, %d, '%s', %d)" % (
            row["INJURY_ID"], row["Player_ID"], row["Injury_type"], row["Duration"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def option13(cur, con):
    """
    Function to delete from INJURY table with injury id
    """
    try:
        injury_id = int(input("Enter Injury ID to delete: "))
        query = "DELETE FROM INJURY WHERE INJURY_ID = %d;" % injury_id
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

def option14(cur, con):
    """
    Function to delete from COACH table with coach id
    """
    try:
        coach_id = int(input("Enter Coach ID to delete: "))
        query = "DELETE FROM COACH WHERE Coach_ID = %d;" % coach_id
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

def option15(cur, con):
    """
    Function to update coaching specialization of coach with coach id
    """
    try:
        coach_id = int(input("Enter Coach ID to update: "))
        new_specialization = input("Enter new Coaching Specialization: ")
        query = "UPDATE COACH SET Coaching_specialty = '%s' WHERE Coach_ID = %d;" % (new_specialization, coach_id)
        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)

def option16(cur, con):
    """
    Function to update the stadium capacity
    """
    try:
        stadium_id = int(input("Enter Stadium ID to update: "))
        new_capacity = int(input("Enter new Capacity: "))
        query = "UPDATE STADIUM SET Capacity = %d WHERE Stadium_ID = %d;" % (new_capacity, stadium_id)
        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)

def dispatch(ch, cur, con):
    """
    Function that maps helper functions to option entered
    """
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
    elif(ch == 11):
        option11(cur, con)
    elif(ch == 12):
        option12(cur, con)
    elif(ch == 13):
        option13(cur, con)
    elif(ch == 14):
        option14(cur, con)
    elif(ch == 15):
        option15(cur, con)
    elif(ch == 16):
        option16(cur, con)
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
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
                # Here taking example of Employee Mini-world
                print("1. Get players info whose nationality belongs to england")  # Hire an Employee
                # select * from PLAYER where Nationality = 'England';
                print("2. Get Team info whose established year is 2008")  # Fire an Employee
                # SELECT * FROM TEAM WHERE EstablishedYear = 2008;
                print("3. Get stadium name whose capacity is greater than or equal to 50k")  # Promote Employee
                # SELECT StadiumName FROM STADIUM WHERE Capacity >= 50000;
                print("4. Get Team Name whose established year is greater than 2008 ")  # Employee Statistics
                # SELECT Team Name, 
                # City FROM TEAM 
                # WHERE EstablishedYear >= 2010;
                print("5. Get player name whose scored highest and his score in match 2")
                #  SELECT p.player_name, ps.`runs scored` AS Highest_Runs FROM PLAYER p JOIN PLAYER_STATS ps ON p.Player_ID = ps.Player_ID WHERE ps.Match_ID = 2 ORDER BY ps.`runs scored` DESC LIMIT 1;
                print("6. Get total runs scored in all matches")

                print("7. Get Team info whose team name has kings in it")

                print("8. Get Player info whose name has arma in it")

                print("9. Number of players who are suffering from Hamstring in Mumbai Indians.")

                print("10. Number of teams scored above 180 in all matches")

                print("11. Insert into PLAYER table")

                print("12. Insert into INJURY table")

                print("13. DELETE from INJURY table with injury id")

                print("14. DELETE from COACH table with coach id")

                print("15. Update coaching specialization of coach with coach id")

                print("16. Update the stadium capacity")
                
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 17:
                    exit()
                else:
                    dispatch(ch, cur, con)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
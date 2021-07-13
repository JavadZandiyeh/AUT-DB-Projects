import mysql.connector

cursor = ""
connection = ""

try:
    # connecting to data base ghanari_2
    connection = mysql.connector.connect(host='localhost', database='ghanari_2', user='root', password='javad-9831032')
    cursor = connection.cursor(buffered=True)

    print("**** MySQL connection is opened ****")
    print('note :> use "help" command')

    # get requests and response to it
    while True:
        user_request = input().split()
        command = user_request[0]

        if command == 'help':
            print("""
            list of commands you can use
            (just write the command, details will be asked you in the next steps):
            * help :> help box
            * finish :> finish the program
            * CreateAccount :> create account
            * LoginToAccount :> login to account
            * LoginCheck :> check login of all users
            * GetCurrentUser :> get current user which is in app
            * Follow :> follow users
            * UnFollow :> unFollow users
            * Block :> block users
            * UnBlock :> unBlock users
            * SendAva :> send Ava
            * TrendHashTag :> find trend hash tags
            * SeePersonalAva :> see list of your Avas
            * SeeAvasOfSpecificHashtag :> which Avas used a specific hash tag
            * LikeAva :> like Ava
            * FindNumberOfLikes :> how many users liked this Ava
            * ListOfLikers :> see which users liked this Ava
            * FindTrendAvas :> find trend Avas
            * FindCommentsOfAva :> find comments on this Ava
            * FindAvaOfBeFollowed :> find Ava of users you follow them
            * FindAvaOfUsers :> find Ava of users
            * SendMessage :> send message
            * FindReceivedMessages :> find received messages
            * FindValidMessageSendersToMe :> find users which have sent valid messages on you
            """)

        elif command == 'finish':
            break

        elif command == 'CreateAccount':
            FirstName = input('FirstName: ')
            LastName = input('LastName: ')
            Username = input('Username: ')
            Password = input('Password: ')
            Birthday = input('Birthday: ')
            Biography = input('Biography: ')

            args = (FirstName, LastName, Username, Password, Birthday, Biography)
            try:
                cursor.callproc('CreateAccount', args)
                connection.commit()
                print('done')
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'LoginToAccount':
            Username = input('Username: ')
            args = (Username, )
            try:
                cursor.callproc('LoginToAccount', args)
                connection.commit()
                print('done')
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'LoginCheck':
            Username = input('Username: ')
            args = (Username, )
            try:
                cursor.callproc('LoginCheck', args)
                connection.commit()

                print("Username :: Login Time")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'GetCurrentUser':
            try:
                cursor.execute('select GetCurrentUser()')
                connection.commit()
                print("Current User: {}".format(cursor.fetchone()[0]))
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'Follow':
            ToBeFollowed = input('ToBeFollowed: ')
            args = (ToBeFollowed, )
            try:
                cursor.callproc('Follow', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'UnFollow':
            ToBeUnFollowed = input('ToBeUnFollowed: ')
            args = (ToBeUnFollowed, )
            try:
                cursor.callproc('UnFollow', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'Block':
            Blocked = input('ToBeBlocked: ')
            args = (Blocked, )
            try:
                cursor.callproc('Block', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'UnBlock':
            UnBlocked = input('ToBeUnBlocked: ')
            args = (UnBlocked, )
            try:
                cursor.callproc('UnBlock', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'SendAva':
            Content = input("Content: ")
            CommentOn = input("CommentOn: ")
            if CommentOn == "":
                CommentOn = None
            else:
                CommentOn = int(CommentOn)
            args = (Content, CommentOn)
            try:
                cursor.callproc('SendAva', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'TrendHashTag':
            try:
                cursor.callproc('TrendHashTag')
                connection.commit()
                print("Content :: NumberOfUsage")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'SeePersonalAva':
            try:
                cursor.callproc('SeePersonalAva')
                connection.commit()
                print("Content :: SendingTime")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'SeeAvasOfSpecificHashtag':
            hash_tag = input("HashTag: ")
            args = (hash_tag, )
            try:
                cursor.callproc('SeeAvasOfSpecificHashtag', args)
                connection.commit()

                print("Content :: Sender :: SendingTime :: HashTag")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'LikeAva':
            id_ava = int(input("Ava ID: "))
            args = (id_ava, )
            try:
                cursor.callproc('LikeAva', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindNumberOfLikes':
            id_ava = int(input("Ava ID: "))
            args = (id_ava, )
            try:
                cursor.callproc('FindNumberOfLikes', args)
                connection.commit()
                print("Content :: num_likes")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'ListOfLikers':
            id_ava = int(input("Ava ID: "))
            args = (id_ava, )
            try:
                cursor.callproc('ListOfLikers', args)
                connection.commit()
                print("Content :: WhoLiked")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindTrendAvas':
            try:
                cursor.callproc('FindTrendAvas')
                connection.commit()
                print("Content :: num_like")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindCommentsOfAva':
            id_ava = int(input("Ava ID: "))
            args = (id_ava,)
            try:
                cursor.callproc('FindCommentsOfAva', args)
                connection.commit()
                print("Content :: Sender")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindAvaOfBeFollowed':
            try:
                cursor.callproc('FindAvaOfBeFollowed')
                connection.commit()
                print("Content :: Sender :: SendingTime")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindAvaOfUsers':
            ava_sender = input("Ava Sender: ")
            args = (ava_sender,)
            try:
                cursor.callproc('FindAvaOfUsers', args)
                connection.commit()
                print("Content :: SendingTime")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'SendMessage':
            Content_Ava = input("Content_Ava: ")
            Content_Text = input("Content_Text: ")
            Receiver = input("Receiver: ")

            if Content_Ava == "":
                Content_Ava = None
            else:
                Content_Ava = int(Content_Ava)

            if Content_Text == "":
                Content_Text = None

            args = (Content_Ava, Content_Text, Receiver)
            try:
                cursor.callproc('SendMessage', args)
                connection.commit()
                print("done")
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindReceivedMessages':
            try:
                cursor.callproc('FindReceivedMessages')
                connection.commit()
                print("id :: ContentAva :: ContentText :: Sender :: Receiver :: SendingTime")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        elif command == 'FindValidMessageSendersToMe':
            try:
                cursor.callproc('FindValidMessageSendersToMe')
                connection.commit()
                print("Sender")
                for result in cursor.stored_results():
                    for row in result.fetchall():
                        print(row)
            except mysql.connector.Error as error:
                print("\033[2;31;43m MySQL Error: {} \033[0;0m".format(error))

        else:
            print("No such command found")
            
except mysql.connector.Error as error:
    print("MySQL Error: {}".format(error))
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("**** MySQL connection is closed ****")

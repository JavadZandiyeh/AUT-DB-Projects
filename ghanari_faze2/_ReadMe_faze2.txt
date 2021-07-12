sequence of executing queries:
1.  TablesCreation
2.  Procedures_Triggers_Functions
	1) CreateAccount // LoginToAccount // Trigger_AccountLog // LoginCheck // Function_GetCurrentUser
	2) Follow // UnFollow // Block // UnBlock
	3) SendAva&CommentOnAva // Trigger_AvaLog // Trigger_AvaHashTag // TrendHashTag // SeePersonalAva
	   SeeAvasOfSpecificHashtag // LikeAva // FindNumberOfLikes // ListOfLikers // FindTrendAvas
	   FindCommentsOfAva // FindAvaOfBeFollowed // FindAvaOfUsers
	4) SendMessage // FindReceivedMessages // FindValidMessageSendersToMe
	

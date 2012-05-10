//
//  Constants.m
//  Frienemy
//
//  Created by Ross Chapman on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"

NSString * const PALoginFinishedNotification = @"PALoginFinishedNotification";
NSString * const PAFriendsListFinishedNotification = @"PAFriendsListFinishedNotification";
NSString * const PAWallFinishedNotification = @"PAWallFinishedNotification";
NSString * const PAImageDownloadedNotification = @"PAImageDownloadedNotification";
NSString * const PAImageDownloadedDateKey = @"PAImageDownloadedDateKey";

NSString * const FQLFriendsListQuery = @"SELECT+about_me,activities,affiliations,allowed_restrictions,birthday,birthday_date,books,contact_email,current_location,education_history,email,email_hashes,family,first_name,has_added_app,hometown_location,hs_info,interests,is_app_user,is_blocked,last_name,locale,meeting_for,meeting_sex,middle_name,movies,music,name,notes_count,online_presence,pic,pic_big,pic_big_with_logo,pic_small,pic_small_with_logo,pic_square,pic_square_with_logo,pic_with_logo,political,profile_blurb,profile_update_time,profile_url,proxied_email,quotes,relationship_status,religion,sex,significant_other_id,status,third_party_id,timezone,tv,uid,username,verified,wall_count,website,work_history+FROM+user+WHERE+uid+IN+(SELECT+uid2+FROM+friend+WHERE+uid1+=+me())";

NSString * const FQLCurrentUserQuery = @"SELECT+about_me,activities,affiliations,allowed_restrictions,birthday,birthday_date,books,contact_email,current_location,education_history,email,email_hashes,family,first_name,has_added_app,hometown_location,hs_info,interests,is_app_user,is_blocked,last_name,locale,meeting_for,meeting_sex,middle_name,movies,music,name,notes_count,online_presence,pic,pic_big,pic_big_with_logo,pic_small,pic_small_with_logo,pic_square,pic_square_with_logo,pic_with_logo,political,profile_blurb,profile_update_time,profile_url,proxied_email,quotes,relationship_status,religion,sex,significant_other_id,status,third_party_id,timezone,tv,uid,username,verified,wall_count,website,work_history+FROM+user+WHERE+uid+=+me()";

NSString * const FQLCurrentUserWallQuery = @"SELECT+action_links,actor_id,app_data,app_id,attachment,attribution,comments,created_time,filter_key,impressions,likes,message,permalink,post_id,privacy,source_id,tagged_ids,target_id,type,updated_time,viewer_id,xid+FROM+stream+WHERE+filter_key+in+(SELECT+filter_key+FROM+stream_filter+WHERE+uid=me()+AND+type='newsfeed')";

NSString * const FQLUserWallQueryFormatString = @"SELECT action_links, actor_id, app_data, app_id, attachment, attribution, comments, created_time, filter_key, impressions, likes, message, permalink, post_id, privacy, source_id, tagged_ids, target_id, type, updated_time, viewer_id, xid FROM stream WHERE filter_key in (SELECT filter_key FROM stream_filter WHERE uid=%@ AND type=\'newsfeed\')";


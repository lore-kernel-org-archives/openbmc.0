Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyFNF0MFtzDrb7
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 00:51:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBEDnTmw063842
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 08:51:37 -0500
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2eurjhwarb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 08:51:36 -0500
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 13:51:35 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 13:51:32 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBEDpVnV57409620; Thu, 14 Dec 2017 13:51:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 870FE42045;
 Thu, 14 Dec 2017 13:45:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19BEC42049;
 Thu, 14 Dec 2017 13:45:44 +0000 (GMT)
Received: from [9.124.218.75] (unknown [9.124.218.75])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Dec 2017 13:45:43 +0000 (GMT)
Subject: Re: OpenBMC community telecon - 11/27 Agenda
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery> <20171206004931.GI113334@mauery>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 14 Dec 2017 19:21:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171206004931.GI113334@mauery>
Content-Type: multipart/alternative;
 boundary="------------475B11AC58709D66C69A128B"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17121413-0040-0000-0000-0000041A1EA8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121413-0041-0000-0000-000020BD3526
Message-Id: <efd52422-0327-c86d-7810-b98917fba651@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712140190
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 13:51:41 -0000

This is a multi-part message in MIME format.
--------------475B11AC58709D66C69A128B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Vernon,

There are a few points about IPMI User accounts where more details are 
needed.

a) IPMI User configuration(password/privilege) is done for a per channel 
basis. How do you plan to implement where the same user would have 
different passwords/privileges?

b) IPMI user accounts are mapped to User ID, and all user account 
related commands refer to user id to identify an account. I hope we need 
to consider that when we design.

c) User ID 1 account has no user name. Would we support this account?

d) Can you add API's to map enable/disable IPMI accounts, so that IPMI 
user accounts can be enabled/disabled by retaining all other properties?

Regards,

Tom


On Wednesday 06 December 2017 06:19 AM, Vernon Mauery wrote:
> On 04-Dec-2017 05:02 PM, Vernon Mauery wrote:
>> On 04-Dec-2017 05:06 PM, Brad Bishop wrote:
>>> multi configuration images / runtime configurability
>>> user management
>>> secure coding guidelines
>>>
>>> —————————
>>> Monday, 10:00pm EDT
>>> 888-426-6840
>>> password: 85891389
>>
>> For the discussion on user management.
>>
>> Overview:
>> 1. User management is done via PAM.
>> 2. If IPMI is being used, PAM loads the pam_ipmi.so password module.
>>  a. pam_ipmi.so intercepts password changes and saves the password
>>     for IPMI-enabled users to a file that can be read at a later time
>>     to initiate an RMCP+ session. (encrypted or obfuscated with 
>> a      per-BMC key so no passwords are written directly in flash.)
>>  b. pam_ipmi.so implements a method to decrypt passwords and provide
>>     them to host-ipmi (for test password command) and net-ipmi (for
>>     session initiation)
>> 3. If a user is not enabled for IPMI, their password will not be saved
>>  in the ipmi database, and thus must be reset if/when that user gains
>>  IPMI capability.
>> 4. If a user loses IPMI capability, their password is reset to force a
>>  password change so their password is secure again.
>> 5. Capabilities is done via unix groups
>>  a. Groups like ipmi, webserver, redfish, ssh, sol can provide 
>> login      or 'channel' access.
>>  b. Groups like user-manager, media, power, sensor, etc., can provide
>>     fine-grained access for various capabilities. Providers of      
>> capabilities should check to see that accessors (users) have the      
>> required permission.
>> 6. Admin-defined 'super-groups'
>>  a. Provide a set of pre-defined groups of capabilities that can be
>>     assigned to users: Admin, User, Operator or similar that each have
>>     groups associated with them.
>>  b. Changes to groups via APIs can make sure that if a user is      
>> assigned to a 'super-group' will stay assigned to the sub-groups
>>  c. Changes made to users via manual commands may override API groups
>
> Items yet to be decided:
> 1. How providers of services export the service/permission pairs so 
> the user manager can manage the permission groups.
> 2. How to manage the permissions groups (is there a PAM group mechanism?)
> 3. How to create users (call adduser?)
> 4. Do we force users to have different passwords for RMCP+ and other 
> logins because RMCP+ passwords are insecurely stored? Or is this a 
> policy thing that we allow system administrators to choose?
>
>
> --Vernon
>
>>
>> Methods:
>>   1. CREATE_USER
>>       Privilege-required: USER-MANAGER
>>       Args:
>>           UserName - STRING (16 bytes only - else role change to IPMI 
>> can't be done)
>>           Password - Byte Array (Max of 20 bytes if IPMID is chosen. For
>>                      others can send more bytes, but change role to 
>> IPMI will
>>                      request password again under 20 bytes)
>>           Roles - STRING with comma separated
>>       Return:
>>           SUCCESS ERR_USERNAME_EXIST ERR_PASSWORD_FAILS ERR_ROLE_FAILS
>>           ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
>>           ERR_AUTHORIZATION_FAIL
>>
>>   2. DELETE_USER
>>       Privilege-required: USER-MANAGER
>>       Args:
>>           UserName - STRING
>>       Return:
>>           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN 
>> ERR_AUTHORIZATION_FAIL
>>
>>   3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
>>       Privilege-required: USER-MANAGER
>>       Args:
>>           UserName - STRING
>>           New Password (if changed) - Byte Array
>>           New Role (if changed) - Array of STRING
>>       Return:
>>           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN 
>> ERR_AUTHORIZATION_FAIL
>>           ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE
>>
>>   4. CHANGE_PASSWORD (SELF)
>>       Privilege-required: Any Valid user
>>       Args:
>>           New Password - Byte Array
>>       Return:
>>           SUCCESS ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_UNKNOWN
>>
>>   5. LIST_USER_DETAILS
>>       Privilege-required: USER-MANAGER
>>       Args:
>>           NULL
>>       Return:
>>           Array of:
>>               USER_NAME (String)
>>               ROLES (String)
>>
>> Signals:
>>   1. UPDATED_USER_SIGNAL
>>       Args:
>>           UserName of updated user
>>           UpdateType:
>>               Role changed / User Deleted / User created / Password 
>> Changed etc.
>>
>


--------------475B11AC58709D66C69A128B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font size="-1">Hey Vernon,</font></p>
    <p><font size="-1">There are a few points about IPMI User accounts
        where more details are needed.<br>
      </font></p>
    <p><font size="-1">a) IPMI User configuration(password/privilege) is
        done for a per channel basis. How do you plan to implement where
        the same user would have different passwords/privileges?</font></p>
    <p><font size="-1">b) IPMI user accounts are mapped to User ID, and
        all user account related commands refer to user id to identify
        an account. I hope we need to consider that when we design.</font></p>
    <p><font size="-1">c) User ID 1 account has no user name. Would we
        support this account?</font></p>
    <p><font size="-1">d) Can you add API's to map enable/disable IPMI
        accounts, so that IPMI user accounts can be enabled/disabled by
        retaining all other properties?</font></p>
    <p><font size="-1">Regards,</font></p>
    <p><font size="-1">Tom</font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On Wednesday 06 December 2017 06:19 AM,
      Vernon Mauery wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20171206004931.GI113334@mauery">On
      04-Dec-2017 05:02 PM, Vernon Mauery wrote:
      <br>
      <blockquote type="cite">On 04-Dec-2017 05:06 PM, Brad Bishop
        wrote:
        <br>
        <blockquote type="cite">multi configuration images / runtime
          configurability
          <br>
          user management
          <br>
          secure coding guidelines
          <br>
          <br>
          —————————
          <br>
          Monday, 10:00pm EDT
          <br>
          888-426-6840
          <br>
          password: 85891389
          <br>
        </blockquote>
        <br>
        For the discussion on user management.
        <br>
        <br>
        Overview:
        <br>
        1. User management is done via PAM.
        <br>
        2. If IPMI is being used, PAM loads the pam_ipmi.so password
        module.
        <br>
         a. pam_ipmi.so intercepts password changes and saves the
        password
        <br>
            for IPMI-enabled users to a file that can be read at a later
        time
        <br>
            to initiate an RMCP+ session. (encrypted or obfuscated with
        a      per-BMC key so no passwords are written directly in
        flash.)
        <br>
         b. pam_ipmi.so implements a method to decrypt passwords and
        provide
        <br>
            them to host-ipmi (for test password command) and net-ipmi
        (for
        <br>
            session initiation)
        <br>
        3. If a user is not enabled for IPMI, their password will not be
        saved
        <br>
         in the ipmi database, and thus must be reset if/when that user
        gains
        <br>
         IPMI capability.
        <br>
        4. If a user loses IPMI capability, their password is reset to
        force a
        <br>
         password change so their password is secure again.
        <br>
        5. Capabilities is done via unix groups
        <br>
         a. Groups like ipmi, webserver, redfish, ssh, sol can provide
        login      or 'channel' access.
        <br>
         b. Groups like user-manager, media, power, sensor, etc., can
        provide
        <br>
            fine-grained access for various capabilities. Providers
        of      capabilities should check to see that accessors (users)
        have the      required permission.
        <br>
        6. Admin-defined 'super-groups'
        <br>
         a. Provide a set of pre-defined groups of capabilities that can
        be
        <br>
            assigned to users: Admin, User, Operator or similar that
        each have
        <br>
            groups associated with them.
        <br>
         b. Changes to groups via APIs can make sure that if a user
        is      assigned to a 'super-group' will stay assigned to the
        sub-groups
        <br>
         c. Changes made to users via manual commands may override API
        groups
        <br>
      </blockquote>
      <br>
      Items yet to be decided:
      <br>
      1. How providers of services export the service/permission pairs
      so the user manager can manage the permission groups.
      <br>
      2. How to manage the permissions groups (is there a PAM group
      mechanism?)
      <br>
      3. How to create users (call adduser?)
      <br>
      4. Do we force users to have different passwords for RMCP+ and
      other logins because RMCP+ passwords are insecurely stored? Or is
      this a policy thing that we allow system administrators to choose?
      <br>
      <br>
      <br>
      --Vernon
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Methods:
        <br>
          1. CREATE_USER
        <br>
              Privilege-required: USER-MANAGER
        <br>
              Args:
        <br>
                  UserName - STRING (16 bytes only - else role change to
        IPMI can't be done)
        <br>
                  Password - Byte Array (Max of 20 bytes if IPMID is
        chosen. For
        <br>
                             others can send more bytes, but change role
        to IPMI will
        <br>
                             request password again under 20 bytes)
        <br>
                  Roles - STRING with comma separated
        <br>
              Return:
        <br>
                  SUCCESS ERR_USERNAME_EXIST ERR_PASSWORD_FAILS
        ERR_ROLE_FAILS
        <br>
                  ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
        <br>
                  ERR_AUTHORIZATION_FAIL
        <br>
        <br>
          2. DELETE_USER
        <br>
              Privilege-required: USER-MANAGER
        <br>
              Args:
        <br>
                  UserName - STRING
        <br>
              Return:
        <br>
                  SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
        ERR_AUTHORIZATION_FAIL
        <br>
        <br>
          3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
        <br>
              Privilege-required: USER-MANAGER
        <br>
              Args:
        <br>
                  UserName - STRING
        <br>
                  New Password (if changed) - Byte Array
        <br>
                  New Role (if changed) - Array of STRING
        <br>
              Return:
        <br>
                  SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
        ERR_AUTHORIZATION_FAIL
        <br>
                  ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL
        ERR_NO_RESOURCE
        <br>
        <br>
          4. CHANGE_PASSWORD (SELF)
        <br>
              Privilege-required: Any Valid user
        <br>
              Args:
        <br>
                  New Password - Byte Array
        <br>
              Return:
        <br>
                  SUCCESS ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL
        ERR_UNKNOWN
        <br>
        <br>
          5. LIST_USER_DETAILS
        <br>
              Privilege-required: USER-MANAGER
        <br>
              Args:
        <br>
                  NULL
        <br>
              Return:
        <br>
                  Array of:
        <br>
                      USER_NAME (String)
        <br>
                      ROLES (String)
        <br>
        <br>
        Signals:
        <br>
          1. UPDATED_USER_SIGNAL
        <br>
              Args:
        <br>
                  UserName of updated user
        <br>
                  UpdateType:
        <br>
                      Role changed / User Deleted / User created /
        Password Changed etc.
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------475B11AC58709D66C69A128B--

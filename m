Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420kVQ1njTzF31M
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 21:51:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7TBdDFW048126
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 07:51:22 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m5qqpr4jk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 07:51:22 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 29 Aug 2018 12:51:20 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Aug 2018 12:51:16 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7TBpFBY43647012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Aug 2018 11:51:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF6BA42047;
 Wed, 29 Aug 2018 14:51:13 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C6442045;
 Wed, 29 Aug 2018 14:51:11 +0100 (BST)
Received: from [9.79.203.4] (unknown [9.79.203.4])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Aug 2018 14:51:11 +0100 (BST)
Subject: Re: Mapping LDAP group to user roles
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>,
 "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
 <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
 <1ab96997-92ac-87fb-7d45-795d5747e4aa@linux.vnet.ibm.com>
 <7b6b2198-4725-e487-12ad-bf18cb4297b5@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 29 Aug 2018 17:21:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7b6b2198-4725-e487-12ad-bf18cb4297b5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082911-4275-0000-0000-000002B1D490
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082911-4276-0000-0000-000037BADA8E
Message-Id: <bc4cac08-01d8-4dda-1c24-b624f241a4fc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-29_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808290127
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 11:51:26 -0000

Hi Richard,

On Tuesday 28 August 2018 09:12 PM, Thomaiyar, Richard Marian wrote:
> Ed / Brad / Tom / Ratan,
>
> 1. REDFISH can't manage LDAP user accounts. i.e. It will be beyond the 
> scope of REDFISH and won't list any LDAP user accounts (REDFISH can 
> implement LDAP privilege mapping configuration though)  --> Agree?
I agree on it.
>
> 2. Authentication must happen only using pam_authenticate (For 
> security purpose), and for authorization can use
>
>                 a). getgrnam_r to get the group & privilege
>
>                 b). use D-Bus API get property to get the group & 
> privilege role of the user
>
>                 c). Maintain 1:1 mapping with application through 
> signal handler to do user sync, which can be used directly (IPMI Code 
> under review does this logic).
>
>     Problem with option #a is it requires individual way to map group 
> & privilege, hence it was not recommended, and suggestion was to use 
> #b or #c. But with ldap user accounts #b & #c can't be used as there 
> is no local user object and hence thinking about introducing a generic 
> D-Bus API (under Manager) to return user Info say GetUserInfo --> 
> which accepts user name as argument, and returns back groups & 
> privilege of the user (irrespective of whether the user is local / 
> ldap), in this way applications doesn't need to use different flow to 
> query ldap / local user account information and can use one single flow?
If I am getting it correctly that you proposed that implementation logic 
of getting the roles of user in the user manager interface by 
introducing the D-bus Method getUserInfo().

The flow for the getUserInfo() would be as follows

1) Check that the user is local and if local then get the role from the 
local user D-bus object.

2) if user is not local user(ldap user) then get the role through the 
group -- Role mapping.
        a) getgrnam_r will get the ldap user group name as the libc 
would be using the libnss_ldap
        b) once we have the group name then we can get the priviledge 
role for that ldap user via the D-bus API.

I agree with this proposal to put this logic inside the app which 
implements the manager interface.

I am wondering what the getUserInfo API would return as part of user 
info, Would it be

1) Group Name
2) Privilege

Should we include the UserEnabled and the UserAccountLockedState as part 
of user info? would it be useful?
I am asking as if user password has been expired or account locked or 
new password required would have been handled through pam account
management which is part of authentication.

What is your view on this?


Are you planning to implement the above D-bus api(GetUserInfo) or can we 
help here?
>
> Note: This method must be implemented, so that it can internally use 
> the LDAP privilege mapper config to determine the privilege that has 
> to be applied to user, and can pass supported groups as ssh, redfish & 
> web (or can implement ldapGroupMapper too if needed).
>
> Any thoughts about this flow?
>
> Regards,
>
> Richard
>
>
> On 8/28/2018 8:25 PM, Tom Joseph wrote:
>>
>> On Thursday 23 August 2018 09:59 PM, Tanous, Ed wrote:
>>>>> It would be great if you could document your proposal as a patch 
>>>>> to the
>>>> existing user management document here:
>>>>> https://github.com/openbmc/docs/blob/master/user_management.md
>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>>> This is a great start, but a lot of detail seems to be missing. You 
>>> don't mention anything of the two user roles you mentioned in your 
>>> original email.  Has that changed?  I don't see any mention of the 
>>> dbus interface, has that changed?  I don't see that you've modified 
>>> any of the login flows in the document, but the LDAP section talks 
>>> about authorizing users via DBus, which certainly should include 
>>> changes to the flow diagrams.
>> Thanks Ed for the feedback. The D-Bus interface is updated to support 
>> all the privilege roles supported by OpenBMC. The document ha sonly 
>> the user creation flows. Richard mentioned he has the login flows 
>> updated in the downstream and he will upstream it. So I will update 
>> the authorization flow on top of that.
>>
>> Documentation:
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>>
>> D-Bus Interface:
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12027/ 
>>
>>> It would be great if you could take another pass at this, and see if 
>>> you could add a little more detail to your proposal.
>>>
>>> Thanks,
>>>
>>> -Ed
>>
>

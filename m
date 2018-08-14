Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qhpH0TDDzF15Q
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 05:03:50 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7EIxPLp096476
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 15:03:47 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kv1des35w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 15:03:46 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 14 Aug 2018 15:03:46 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Aug 2018 15:03:43 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7EJ3hae3670512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Aug 2018 19:03:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB1EAC05F;
 Tue, 14 Aug 2018 15:04:04 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A5F5AC05E;
 Tue, 14 Aug 2018 15:04:04 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 Aug 2018 15:04:04 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 14 Aug 2018 14:10:49 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Disable Local Users Proposal
In-Reply-To: <dc6ce171-7750-5a44-c805-a64626e3c207@linux.intel.com>
References: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
 <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
 <1b46768ae45e718f5000801222996318@linux.vnet.ibm.com>
 <dc6ce171-7750-5a44-c805-a64626e3c207@linux.intel.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18081419-0068-0000-0000-00000328FEA1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009544; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073509; UDB=6.00553137; IPR=6.00853467; 
 MB=3.00022716; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-14 19:03:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081419-0069-0000-0000-00004563CE22
Message-Id: <2340763be6ade5ae096367b6d18e8114@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-14_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808140192
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
X-List-Received-Date: Tue, 14 Aug 2018 19:03:51 -0000

Hi Richard,


On 2018-08-14 12:48, Thomaiyar, Richard Marian wrote:
> Hi Matt,
> 
> I am not sure, whether you want to permanently disable local accounts
> or only make it in a configurable way ?

We need to let this be done on premise, and not have it baked into an 
image.

> 
> In order to disable the root user login, have you tried password
> expiry logic (D-bus interface API provides option to disable the user,
> which relies on this), which can be set in the /etc/shadow file during
> compilation itself. Won't this fix your problem instead of removing
> the pam modules ?

See below


  In case if your requirement is to disable it
> permanently to avoid user creation etc, then user D-Bus interfaces
> should not be implemented(i.e it should never be exposed). (Also what
> about serial port login ? by default it will land up  in shell or
> will be disabled for local accounts here too ?).

We want to disable serial port login too, which this method does, and I 
assume
expiring the account does as well.

> 
> Related to the D-Bus interfaces to disable the local accounts (under
> review), i am not sure, how it is going to be different than disabling
> each user ?

Just that you weren't creating an object for the root account, or any 
other
system accounts, which we also need to disable.  Can you see a design in
which your code would also create objects for those too, and not allow
new users to be created if we were in this disabled mode?


> Because even this property can be set to TRUE and then
> users can be created / configured right ?

I believe this case involves LDAP users with either write or read-only
access, and if one with write access wants to enable local users again,
that is OK as far as we are concerned.  But otherwise, they don't want
to have to deal with changing BMC passwords every X number of days
which they'd have to do with local accounts and their IT policies.



> 
> Regards,
> Richard
> 
> On 8/14/2018 8:56 PM, Matt Spinler wrote:
>> On 2018-08-13 03:21, Ratan Gupta wrote:
>>> Hi Matt,
>>> 
>>> Please find my comments inline
>>> 
>>> Ratan
>>> 
>>> 
>>> 
>>> On Saturday 11 August 2018 02:57 AM, Matt Spinler wrote:
>>>> Hi,
>>>> 
>>>> We have a requirement to disable all local accounts on the BMC,
>>>> including root, so the only logins allowed would be via LDAP 
>>>> authenticated
>>>> accounts.
>>>> 
>>>> It was recommended that I do this by removing the pam_unix module 
>>>> from
>>>> /etc/pam.d/common-auth and/or common-account(I think?), and also 
>>>> remove
>>>> ~/.ssh/authorized_keys if present.
>>> By removing the authorized_keys means if somebody have uploaded their
>>> keys to enable the password
>>> less login.
>>> so by doing so we are removing that possibility.Is it correct or is
>>> there some other intent?
>> 
>> It would disable them when the property is set, but then I guess other
>> users could add them again.  Not sure what else I could do here.
>> 
>>>> 
>>>> I see that the upcoming user manager code in
>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/ 
>>>> doesn't deal with system accounts, which we also need to disable, so 
>>>> my proposal
>>>> is to add an 'AllLocalAccountsDisabled' property to 
>>>> xyz.openbmc_projects.Users.Manager
>>>> to do the disable/reenable by modifying the PAM files.
>>>> 
>>>> I'm thinking this would be independent of the UserEnabled property 
>>>> in the
>>>> Users.Attributes interface, though I could also do the 
>>>> UserEnabled(false)
>>>> on all existing users and disallow anyone from setting to true.
>>> I agree with you on introducing other property
>>> "AllLocalAccountsDisabled" but we should
>>> be consistent that each individual user status should also show its
>>> status as disabled.
>>> it should not be that if admin does enumerate on the users namespace
>>> then manager
>>> interface shows that AllLocalAccountsDisabled is true but each
>>> individual user property show the
>>> userEnabled as true.
>> 
>> 
>> Yea, good point.  Will make them agree.
>> 
>> I put up the D-Bus interface at
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11934/
>>>> 
>>>> There seems to be a bug in the REST server right now that still 
>>>> allows REST
>>>> access with a root login with root disabled, so that would need to 
>>>> be fixed,
>>>> but eventually one could still use LDAP authenticated users to make 
>>>> REST calls.
>>>> 
>>>> This would not affect IPMI.
>>>> 
>>>> Comments/ideas welcome
>>>> 
>>>> Matt
>>>> 
>> 

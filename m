Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgqSZ3sw7zDq66
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 21:35:10 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7SBZ7to057836
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 07:35:08 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cmg3tgdhx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 07:35:07 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 28 Aug 2017 21:35:05 +1000
Received: from d23relay07.au.ibm.com (202.81.31.226)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 28 Aug 2017 21:35:04 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7SBZ3YY42270902
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 21:35:03 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7SBZ3Gm026218
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 21:35:03 +1000
Received: from [9.202.40.48] ([9.202.40.48])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7SBZ2Vb026147; Mon, 28 Aug 2017 21:35:03 +1000
Subject: Re: Design proposal to Non-Interactive password update for REST client
To: Patrick Williams <patrick@stwcx.xyz>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
 <20170814163515.GB20526@asimov.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 28 Aug 2017 17:04:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170814163515.GB20526@asimov.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17082811-0044-0000-0000-0000028423F6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082811-0045-0000-0000-000007179BD4
Message-Id: <51653e69-4ef6-d7b4-e688-1055382e2c46@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708280189
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Aug 2017 11:35:10 -0000

On 08/14/2017 10:05 PM, Patrick Williams wrote:
> On Fri, Aug 11, 2017 at 09:48:48PM +0530, vishwa wrote:
>> This email is about openbmc/openbmc#1714 ( REST API to update root
>> password )
>>
>> Goal is to do Non-interactive password updates to enable a REST client
>> to update the root password.
>>
>> My proposal is to use `getspent(3)` and `putspent(3)` and here is the flow.
>>
>> REST client will provide a method that takes std::string as parameter.
>>
>> The Provider at the BMC will receive the password and does these:
>>
>>    - Executes `getspent(3)` for "root" and gets the entries.
> Make sure you're using getspent_r for this.
Sure
>
> Should be done based on any user, not just 'root'.  We might only
> support 'root' now but will want to easily add support for other users
> in the near future.

Okay. I will have [User] and [Password] in the yaml.
>>    - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
> Is there a portable way to do this?  Is there any library that exists
> already?
I tried to look for that and did not find. I will continue looking.
> Tom and I spoke previously about a possible non-standard crypt algorithm
> in order to satisfy some of the requirements of IPMI RMCP+'s
> authentication protocol without storing plaintext passwords.  Please
> follow up with him and see if what you are proposing here will mesh with
> what he was planning.

I told Tom about this and he would get back to me.

BTW, I put the proposal of using crypt() after looking at:

https://github.com/shadow-maint/shadow/blob/master/src/passwd.c#L245

and

https://github.com/shadow-maint/shadow/blob/6fbc11ce2178205968c37853db752729359c9893/lib/encrypt.c

>>    - Makes a call to `crypt(3)` with the extracted `salt` and `user
>> input` and generates encrypted pass-code
> The salt can/should be random for each password, shouldn't it?  It
> sounds like you are attempting to reuse the salt from the previous
> password and that is not required nor preferred to the best of my
> knowledge.
>
Okay. I can generate a random string from [a-zA-Z0-9./] as needed by crypt()
>>    - Populates the structure and calls `putspent(3)` to update the password
>>
>> Please let me know your opinion on this.
>>
>> Thank you,
>>
>> !! Vishwa !!
>>

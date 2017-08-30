Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhwzN6c8tzDqH0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 16:47:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7U6jJ5d122075
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 02:47:10 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cnqu328ks-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 02:47:10 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 16:47:07 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 16:47:06 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7U6l60A41681006
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 16:47:06 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7U6l62x013353
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 16:47:06 +1000
Received: from [9.202.40.48] ([9.202.40.48])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7U6l4Mp013276; Wed, 30 Aug 2017 16:47:05 +1000
Subject: Re: Design proposal to Non-Interactive password update for REST client
To: Patrick Williams <patrick@stwcx.xyz>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
 <20170814163515.GB20526@asimov.lan>
 <51653e69-4ef6-d7b4-e688-1055382e2c46@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 30 Aug 2017 12:17:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <51653e69-4ef6-d7b4-e688-1055382e2c46@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17083006-0008-0000-0000-00000154B65B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083006-0009-0000-0000-00000987BCC7
Message-Id: <5e6e106f-2c3b-ab45-bdd7-a6a72f1376b3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300100
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
X-List-Received-Date: Wed, 30 Aug 2017 06:47:13 -0000

Tom and I talked and we should be fine with my current proposal.

Here is what we talked:

There would be a new encryption algorithm which would be denoted by some 
number ( Like 1 is for MD5 ) and crypt(3) would be enhanced to handle 
that. Since my proposal does not interpret the number and uses AS IS to 
generate the hash, we should be fine.

On 08/28/2017 05:04 PM, vishwa wrote:
> On 08/14/2017 10:05 PM, Patrick Williams wrote:
>> On Fri, Aug 11, 2017 at 09:48:48PM +0530, vishwa wrote:
>>> This email is about openbmc/openbmc#1714 ( REST API to update root
>>> password )
>>>
>>> Goal is to do Non-interactive password updates to enable a REST client
>>> to update the root password.
>>>
>>> My proposal is to use `getspent(3)` and `putspent(3)` and here is 
>>> the flow.
>>>
>>> REST client will provide a method that takes std::string as parameter.
>>>
>>> The Provider at the BMC will receive the password and does these:
>>>
>>>    - Executes `getspent(3)` for "root" and gets the entries.
>> Make sure you're using getspent_r for this.
> Sure
>>
>> Should be done based on any user, not just 'root'.  We might only
>> support 'root' now but will want to easily add support for other users
>> in the near future.
>
> Okay. I will have [User] and [Password] in the yaml.
>>>    - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
>> Is there a portable way to do this?  Is there any library that exists
>> already?
> I tried to look for that and did not find. I will continue looking.
>> Tom and I spoke previously about a possible non-standard crypt algorithm
>> in order to satisfy some of the requirements of IPMI RMCP+'s
>> authentication protocol without storing plaintext passwords. Please
>> follow up with him and see if what you are proposing here will mesh with
>> what he was planning.
>
> I told Tom about this and he would get back to me.
>
> BTW, I put the proposal of using crypt() after looking at:
>
> https://github.com/shadow-maint/shadow/blob/master/src/passwd.c#L245
>
> and
>
> https://github.com/shadow-maint/shadow/blob/6fbc11ce2178205968c37853db752729359c9893/lib/encrypt.c 
>
>
>>>    - Makes a call to `crypt(3)` with the extracted `salt` and `user
>>> input` and generates encrypted pass-code
>> The salt can/should be random for each password, shouldn't it? It
>> sounds like you are attempting to reuse the salt from the previous
>> password and that is not required nor preferred to the best of my
>> knowledge.
>>
> Okay. I can generate a random string from [a-zA-Z0-9./] as needed by 
> crypt()
>>>    - Populates the structure and calls `putspent(3)` to update the 
>>> password
>>>
>>> Please let me know your opinion on this.
>>>
>>> Thank you,
>>>
>>> !! Vishwa !!
>>>
>

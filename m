Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjVl05hgszDqGZ
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 15:08:28 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7V549rf045986
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 01:08:25 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cpar755yb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 01:08:25 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 31 Aug 2017 01:08:24 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Aug 2017 01:08:22 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7V58Lfe23986406; Thu, 31 Aug 2017 05:08:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF80112047;
 Thu, 31 Aug 2017 01:08:07 -0400 (EDT)
Received: from [9.202.32.168] (unknown [9.202.32.168])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 8CA32112034;
 Thu, 31 Aug 2017 01:08:06 -0400 (EDT)
Subject: Re: Design proposal to Non-Interactive password update for REST client
To: vishwa <vishwa@linux.vnet.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
 <20170814163515.GB20526@asimov.lan>
 <51653e69-4ef6-d7b4-e688-1055382e2c46@linux.vnet.ibm.com>
 <5e6e106f-2c3b-ab45-bdd7-a6a72f1376b3@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Thu, 31 Aug 2017 10:38:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <5e6e106f-2c3b-ab45-bdd7-a6a72f1376b3@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17083105-0048-0000-0000-000001DC4328
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007640; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910052; UDB=6.00456483; IPR=6.00690332; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016938; XFM=3.00000015;
 UTC=2017-08-31 05:08:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083105-0049-0000-0000-00004267AFCB
Message-Id: <59A799C3.3090304@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708310076
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
X-List-Received-Date: Thu, 31 Aug 2017 05:08:29 -0000

If the non-standard crypt algorithm is supported, then the 
/etc/security/policy.conf would have be updated with a custom identifier.
The custom crypt algorithm would interpret the id appropriately and 
invoke the custom algorithm to generated the hash.

In the current implementation, it doesn't seem to have a way to plugin a 
custom algorithm to the standard crypt function.

https://docs.oracle.com/cd/E23824_01/html/821-1456/secsys-15.html

On Wednesday 30 August 2017 12:17 PM, vishwa wrote:
> Tom and I talked and we should be fine with my current proposal.
>
> Here is what we talked:
>
> There would be a new encryption algorithm which would be denoted by 
> some number ( Like 1 is for MD5 ) and crypt(3) would be enhanced to 
> handle that. Since my proposal does not interpret the number and uses 
> AS IS to generate the hash, we should be fine.
>
> On 08/28/2017 05:04 PM, vishwa wrote:
>> On 08/14/2017 10:05 PM, Patrick Williams wrote:
>>> On Fri, Aug 11, 2017 at 09:48:48PM +0530, vishwa wrote:
>>>> This email is about openbmc/openbmc#1714 ( REST API to update root
>>>> password )
>>>>
>>>> Goal is to do Non-interactive password updates to enable a REST client
>>>> to update the root password.
>>>>
>>>> My proposal is to use `getspent(3)` and `putspent(3)` and here is 
>>>> the flow.
>>>>
>>>> REST client will provide a method that takes std::string as parameter.
>>>>
>>>> The Provider at the BMC will receive the password and does these:
>>>>
>>>>    - Executes `getspent(3)` for "root" and gets the entries.
>>> Make sure you're using getspent_r for this.
>> Sure
>>>
>>> Should be done based on any user, not just 'root'.  We might only
>>> support 'root' now but will want to easily add support for other users
>>> in the near future.
>>
>> Okay. I will have [User] and [Password] in the yaml.
>>>>    - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
>>> Is there a portable way to do this?  Is there any library that exists
>>> already?
>> I tried to look for that and did not find. I will continue looking.
>>> Tom and I spoke previously about a possible non-standard crypt 
>>> algorithm
>>> in order to satisfy some of the requirements of IPMI RMCP+'s
>>> authentication protocol without storing plaintext passwords. Please
>>> follow up with him and see if what you are proposing here will mesh 
>>> with
>>> what he was planning.
>>
>> I told Tom about this and he would get back to me.
>>
>> BTW, I put the proposal of using crypt() after looking at:
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_shadow-2Dmaint_shadow_blob_master_src_passwd.c-23L245&d=DwIC-g&c=jf_iaSHvJObTbx-siA1ZOg&r=GM5LgBdrkHptZeS659KO05vpYZn7jOXt0dSR6XkNziE&m=0NWe9soH7zsqWvgyvCxg--peP4EPF2q4uNIf6lSSfMc&s=RwItfMYVZCBZ5am5cCX1wrs0O6FF8rjD7x2GGOMrmH0&e= 
>>
>> and
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_shadow-2Dmaint_shadow_blob_6fbc11ce2178205968c37853db752729359c9893_lib_encrypt.c&d=DwIC-g&c=jf_iaSHvJObTbx-siA1ZOg&r=GM5LgBdrkHptZeS659KO05vpYZn7jOXt0dSR6XkNziE&m=0NWe9soH7zsqWvgyvCxg--peP4EPF2q4uNIf6lSSfMc&s=eXkgvg7YljMlii9b_K46o3btJh4J_QEH0Z-V2gSsQyI&e= 
>>
>>
>>>>    - Makes a call to `crypt(3)` with the extracted `salt` and `user
>>>> input` and generates encrypted pass-code
>>> The salt can/should be random for each password, shouldn't it? It
>>> sounds like you are attempting to reuse the salt from the previous
>>> password and that is not required nor preferred to the best of my
>>> knowledge.
>>>
>> Okay. I can generate a random string from [a-zA-Z0-9./] as needed by 
>> crypt()
>>>>    - Populates the structure and calls `putspent(3)` to update the 
>>>> password
>>>>
>>>> Please let me know your opinion on this.
>>>>
>>>> Thank you,
>>>>
>>>> !! Vishwa !!
>>>>
>>
>

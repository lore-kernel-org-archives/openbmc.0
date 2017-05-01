Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGn3g025FzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 00:33:50 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v41ETNNa074436
 for <openbmc@lists.ozlabs.org>; Mon, 1 May 2017 10:33:43 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2a63vuq0ef-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 10:33:42 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Mon, 1 May 2017 10:33:42 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 1 May 2017 10:33:40 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v41EXesE64684120; Mon, 1 May 2017 14:33:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95532AE03C;
 Mon,  1 May 2017 10:33:28 -0400 (EDT)
Received: from [9.10.255.113] (unknown [9.10.255.113])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 2EF42AE04E;
 Mon,  1 May 2017 10:33:28 -0400 (EDT)
Subject: Re: Switching to 4.10
To: Joel Stanley <joel@jms.id.au>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
 <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
 <a0cb1ba8-19e0-bbdf-d343-7463395e72bf@linux.vnet.ibm.com>
 <CACPK8XfNoBfGVtXN_gKQZMxKaK_krZDjpPq4kCcyrcR7AZ3Dmw@mail.gmail.com>
Cc: Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James
 <eajames@us.ibm.com>, Xo Wang <xow@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Mon, 1 May 2017 09:33:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfNoBfGVtXN_gKQZMxKaK_krZDjpPq4kCcyrcR7AZ3Dmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050114-0036-0000-0000-000001F58454
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007006; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00854734; UDB=6.00422944; IPR=6.00633895; 
 BA=6.00005321; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015256; XFM=3.00000014;
 UTC=2017-05-01 14:33:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050114-0037-0000-0000-0000401BE943
Message-Id: <cef1105a-bffd-a760-3c2f-cbc74b220685@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705010099
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
X-List-Received-Date: Mon, 01 May 2017 14:33:51 -0000



On 04/27/17 8:24 PM, Joel Stanley wrote:
> On Fri, Apr 28, 2017 at 1:39 AM, Matthew Barth
> <msbarth@linux.vnet.ibm.com> wrote:
>>
>> On 04/27/17 2:33 AM, Joel Stanley wrote:
>>> On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr <raltherr@google.com> wrote:
>>>> I saw Joel started https://gerrit.openbmc-project.xyz/#/c/2846/ which has
>>>> a
>>>> defconfig for ast2400.  If you have one for ast2500, please upload a new
>>>> patch set to that change.
>>> I have defconfigs in the tree that are ready to go. I will upload them
>>> to Gerrit when I get the chance.
>>>
>>> I've pulled in:
>>>
>>>    - Ben's ftgmac100 patches from the net-next tree
>>>    - Brendan's i2c patches, v7
>>>    - Andrew's GPIO and Pinconf patches from the gpio and pinconf trees
>>>    - Chris Bostic's FSI series, v6
>>>
>>> These are going through a test cycle on the ast2500evb and Plametto
>>> tonight. Once I have an ack for the i2c device tree, I will add that
>>> to the tree and push to github.
>>>
>>> Eddie, can you let me know which version of your OCC hwmon patches you
>>> want included. Same goes for the CFAM I2C patches. If you want to wait
>>> for review then please ping your reviewers and we can see if we can
>>> get the patches reviewed before we include them.
>>>
>>> Brad, can you point me to the SBE FIFO work that you want included. If
>>> you would prefer to wait for review that is okay.
>>>
>>> Matt, I think do you want to merge the MAX31785 hwmon driver as-is for
>>> now?
>> I thought we already have a MAX31785 driver merged, so what is
>> 'as-is'...does that include the update supporting reading the tach feedback
>> from both rotors as described in
>> issue#652(https://github.com/openbmc/openbmc/issues/652)? The commit you
>> referenced in that issue does not have the dual tach feedback support yet.
> No, that driver is not upstream and therefore it is not in the tree.
> It needs to be included in the OpenBMC tree as part of this work.
>
> Thanks for clarifying the issue about dual tach feedback.
>
> Is it useful for you to have the driver merged as-is, or does it need
> to have that feature enabled before you can do any testing?
It would be best to have both tach feedbacks for this. Whatever the 
current driver interface that hwmon is using provides enough 
functionality for reading a single rotor's feedback along with being 
able to set a target speed to the fans currently. Because of this, I'd 
prefer that we focus on getting the dual tach feedback added and merge 
the complete driver then.

Thanks,

Matt
>
> Cheers,
>
> Joel
>
>> At this point in time, it's important we get the MAX31785 driver updated
>> with this support along with the PCA9552 driver presence & led verification
>> of the fan enclosures.
>>

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 409L7M4dglzF20K
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 17:04:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2R62QjA112264
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 02:04:13 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gyg98887j-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 02:04:12 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 27 Mar 2018 07:04:10 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 27 Mar 2018 07:04:08 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2R648sq52232386; Tue, 27 Mar 2018 06:04:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11592AE045;
 Tue, 27 Mar 2018 06:54:22 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10DF8AE056;
 Tue, 27 Mar 2018 06:54:20 +0100 (BST)
Received: from [9.77.80.56] (unknown [9.77.80.56])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Mar 2018 06:54:19 +0100 (BST)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Sdbusplus-based Shared Library
To: Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 "Tanous, Ed" <ed.tanous@intel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
Cc: Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Tue, 27 Mar 2018 11:34:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18032706-0040-0000-0000-0000042748C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032706-0041-0000-0000-0000262A5F2B
Message-Id: <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-27_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803270061
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 06:04:16 -0000

Hi Andrew,

We raised this concern around an year back with patrick but that time it 
was told we have limited set of users for such classes,

Let it be replicate but now as the code size is getting increased we 
should look for some common library for such classes.

Regards

Ratan Gupta


On Tuesday 27 March 2018 11:17 AM, Andrew Jeffery wrote:
> On Tue, 20 Mar 2018, at 06:03, Patrick Venture wrote:
>> On Mon, Mar 19, 2018 at 11:24 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
>>> Have you tried prototyping to see how much space you'll save?  I suspect it won't be a lot for a few reasons.
>>>
>>> 1. A lot of sdbusplus is template instantiations, and unless we forward declare a number of base template instantiations for use in the shared library, most of the application code will end up in the binary anyway.
>>> 2. Sdbus calls into libsystemd, which is already a shared library.
>>> 3. The filesystem is already compressed, so I suspect that any duplicated methods that aren't inlined will have the same binary code pattern and get duplicated by the squashfs filesystem.
>>>
>>> Those are all the reasons why I haven't really looked into it for the dbus stuff;  I can't speak to the timer stuff, but I suspect the wins in size there are going to be small.
>>>
>>> Normal disclaimer, on this specific library, I haven't prototyped anything, just done back of the napkin guesses, so I could very easily be missing something here.
>>>
>> So my thinking wasn't about reducing size of the binary but rather
>> reducing the toil of maintaining multiple implementations of the same
>> code.
>>
> I'm on board with this idea. There are a bunch of utility classes defined for RAII that are (were) used in phosphor-mboxd that would be much better off defined in some library where they can be reused.
>
> Has anyone looked at this beyond what's in the thread?
>
> Cheers,
>
> Andrew
>

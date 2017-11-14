Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybcM34DjZzDqky
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 17:01:02 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAE5sj0Z097724
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 01:01:01 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e7tcy94t4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 01:01:00 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 14 Nov 2017 01:00:59 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 14 Nov 2017 01:00:57 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAE60uEW35258604; Tue, 14 Nov 2017 06:00:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8FD6B2054;
 Tue, 14 Nov 2017 00:58:07 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.16.74])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 3AA51B204E;
 Tue, 14 Nov 2017 00:58:07 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 54BC64F0D20; Tue, 14 Nov 2017 17:00:54 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Sergey Kachkin <s.kachkin@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Oliver O'Halloran" <oohall@gmail.com>, bsingharora@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: checkstop processing
In-Reply-To: <CACPK8Xd=EKts=4+8mH8khqzBqJRmBjC6sB6RqpEk2SVzc2cOHQ@mail.gmail.com>
References: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
 <CACPK8Xd=EKts=4+8mH8khqzBqJRmBjC6sB6RqpEk2SVzc2cOHQ@mail.gmail.com>
Date: Tue, 14 Nov 2017 17:00:54 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17111406-0052-0000-0000-00000281D648
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008064; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00945598; UDB=6.00477234; IPR=6.00725894; 
 BA=6.00005689; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018004; XFM=3.00000015;
 UTC=2017-11-14 06:00:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111406-0053-0000-0000-0000529E186F
Message-Id: <87375hv1pl.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711140080
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
X-List-Received-Date: Tue, 14 Nov 2017 06:01:04 -0000

Joel Stanley <joel@jms.id.au> writes:
> On Tue, Nov 14, 2017 at 8:04 AM, Sergey Kachkin <s.kachkin@gmail.com> wrote:
>> Hi all,
>>
>> i'm investigating the checkstop processing and looking for a way to isolate
>> a faulty component with OpenBmc.
>> So far SEL logs available via REST are not really helpful.
>>
>> Is there any data source in the openbmc to troubleshoot checkstops?
>>
>> I guess eSEL binary data parsed with eSEL.pl can be more informative but do
>> we have any procedure to grab the binary sel data and parse it with the
>> latest obmc?
>>
>> Currently it seems that IPL checkstop analysis is not really working. i mean
>> that faulty component is not deconfigured on the next boot and gard list is
>> empty.
>> It can be easily duplicated by injecting an error manually via putscom.
>
> I think you've identified an area that would be great for improvement.

Understatement of the year right there :)

This (of course) isn't an OpenBMC specific problem, but rather an
opportunity for OpenBMC to clearly excel against other BMC
implementations.

I'd love to see even the parsed ESELs show up through the REST API,
rather than the current mess which is literally just "printf("ESEL=%02x
%02x %02x...)".

If we have a PEL hidden in there, there's existing userspace to parse it
too (opal-elog-parse), and there's no reason why the BMC couldn't just
output the text representation of it all in addition to the binary.

-- 
Stewart Smith
OPAL Architect, IBM.

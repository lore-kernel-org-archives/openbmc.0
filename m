Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWNWf24t3zDqkH
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 10:54:05 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0UNnMlA081175
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:54:03 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2fu02tnpbm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:54:03 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 30 Jan 2018 18:54:01 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 30 Jan 2018 18:53:58 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0UNrvls48300062; Tue, 30 Jan 2018 23:53:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 822D1AC03A;
 Tue, 30 Jan 2018 18:55:16 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.142.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 02A25AC040;
 Tue, 30 Jan 2018 18:55:16 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id C9B474F0DAB; Wed, 31 Jan 2018 10:53:53 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
Date: Wed, 31 Jan 2018 10:53:53 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18013023-2213-0000-0000-000002647CC8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008454; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982740; UDB=6.00498343; IPR=6.00762022; 
 BA=6.00005802; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019296; XFM=3.00000015;
 UTC=2018-01-30 23:53:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013023-2214-0000-0000-000058F28AAC
Message-Id: <87lggezywe.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300291
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 23:54:06 -0000

Joel Stanley <joel@jms.id.au> writes:
> On Tue, Jan 30, 2018 at 3:17 PM, Stewart Smith
> <stewart@linux.vnet.ibm.com> wrote:
>> Andrew Jeffery <andrew@aj.id.au> writes:
>>> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
>
>>>> 2. U-Boot already performs image checksum validation before booting a
>>>> FIT image
>>>
>>> Typically the rootfs is not part of the FIT, so it will not be checked.
>>>     Some systems supported by OpenBMC directly mount the rootfs rather
>>> than booting through an initrd, which makes rootfs authentication
>>> somewhat tricky. Regardless, with signed images we should expand the
>>> FIT hash check to be a full signature check.
>>
>> dm-verity would solve that (for a ro rootfs).
>
> dm-verity is a worthwhile technology, but being based on device mapper
> and therefore block devices, we can't use it for MTD devices, which is
> all of the upstream OpenBMC machines at this moment.
>
> I would suggest using some kind of pre-mount verification of the raw
> MTD device against a stored checksum would be the way to go. This
> would imply the use of an initrd (as we would need somewhere to store
> the tools that do the verification). The initrd itself would be
> verified by u-boot checking the FIT.

mtdblock could end up being okay for the dm-verity case? There's no
writes there at least... although I haven't spent much/any time thinking
of any implications to that - you're the bigger expert there than I.

-- 
Stewart Smith
OPAL Architect, IBM.

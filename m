Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tztw4Z4qzF3SC
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 05:34:32 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wACIYIaq114667
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 13:34:29 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2nqd0yndqp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 13:34:29 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 12 Nov 2018 18:34:28 -0000
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 12 Nov 2018 18:34:25 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wACIYOMf12648470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Nov 2018 18:34:24 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F570136063;
 Mon, 12 Nov 2018 18:34:24 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1B87136053;
 Mon, 12 Nov 2018 18:34:23 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Nov 2018 18:34:23 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 12 Nov 2018 12:37:16 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: AKASH G J <akashgj91@gmail.com>
Cc: Yu Lei <mine260309@gmail.com>, openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Flashing Image using 'pflash' Tool
In-Reply-To: <CAE33tLFNadnXJEW4ZeSGJ-hM2=HA2s4eqMsXp2fzAJtU=KP0Ag@mail.gmail.com>
References: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
 <CAARXrtkZ8AsP7JBJ_caRfuo9bZNXT5cEbYJy8Xz_8bneP3HUzw@mail.gmail.com>
 <CAE33tLGjGmj5c_isgPmh6Xx_6S8E0X5B2b7pkJQ1tz2Ps-P+8w@mail.gmail.com>
 <CAE33tLFNadnXJEW4ZeSGJ-hM2=HA2s4eqMsXp2fzAJtU=KP0Ag@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18111218-0004-0000-0000-000014B0CAE8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010036; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01116467; UDB=6.00579007; IPR=6.00896576; 
 MB=3.00024130; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-12 18:34:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111218-0005-0000-0000-0000897C83F8
Message-Id: <3dd89c4117a56d55468fa27da8d3a601@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-12_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811120161
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2018 18:34:33 -0000

On 2018-11-12 06:21, AKASH G J wrote:
> Is there any other utility in OpenBMC Linux for writing a file to a
> specified address in flash memory?

The pflash error "isn't erase block aligned" appears when the check for
64k erase blocks is turned on, and the specified address (0x20100000 in
this case) isn't 64k aligned. There may be more details about if there's
a way to switch this check on and off in the skiboot mailing list
(https://github.com/open-power/skiboot) where the pflash tool 
originates.

An alternate tool would be "dd"
(http://man7.org/linux/man-pages/man1/dd.1.html).
The command could look like:
dd if=fitImage.bin of=/dev/mtd0 --skip=0x20100000 -bs=1

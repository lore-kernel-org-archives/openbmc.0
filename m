Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YhVc1F0DzDqH4
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 08:02:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x32KsWEn069360
 for <openbmc@lists.ozlabs.org>; Tue, 2 Apr 2019 17:02:28 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rmbmtu3nw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 17:02:28 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 2 Apr 2019 22:02:26 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 22:02:24 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x32L2Ni525624734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 21:02:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C2E3AC06B;
 Tue,  2 Apr 2019 21:02:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD41AC067;
 Tue,  2 Apr 2019 21:02:23 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 21:02:22 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 02 Apr 2019 16:03:05 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.ibm.com>, msbarth@linux.ibm.com, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Swift BMC machine
In-Reply-To: <CACPK8Xez-iKZ9h7NB9YX+AfNFtoZhsP9Ap8H+1w-cvmAk1S5xQ@mail.gmail.com>
References: <1551820067-53510-1-git-send-email-anoo@linux.ibm.com>
 <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
 <CACPK8Xez-iKZ9h7NB9YX+AfNFtoZhsP9Ap8H+1w-cvmAk1S5xQ@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19040221-0052-0000-0000-000003A699CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010863; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01183415; UDB=6.00619556; IPR=6.00964163; 
 MB=3.00026265; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 21:02:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040221-0053-0000-0000-0000605C6B0B
Message-Id: <e97fb72d9253a582404c704d743bedb6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=848 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020140
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
X-List-Received-Date: Tue, 02 Apr 2019 21:02:33 -0000

On 2019-03-27 01:18, Joel Stanley wrote:
> Hi Adriana,
> 
> 
> Are you going to send a v2 that address Matt's comment?
> 

Yeah, I wanted to wait to get a consensus on the flash layout for this 
system to not have to send a separate patch for it, which seems will 
happen this week, will send a v2 addressing the comments and removing 
the TODO to update the flash layout once I get that information.

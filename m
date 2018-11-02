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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ms3s2Jd7zF37b
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 06:06:00 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA2J4ZZ5028789
 for <openbmc@lists.ozlabs.org>; Fri, 2 Nov 2018 15:05:58 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ngrs4ha06-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 15:05:58 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 2 Nov 2018 19:05:57 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Nov 2018 19:05:53 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wA2J5r0k34603112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Nov 2018 19:05:53 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01612AE05C;
 Fri,  2 Nov 2018 19:05:53 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89E06AE05F;
 Fri,  2 Nov 2018 19:05:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  2 Nov 2018 19:05:52 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 02 Nov 2018 14:08:20 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Firmware Update over Blobs
In-Reply-To: <CAO=notwzpwtUf63=0yna6eHJgwQWQW8k=FQLtZ5pWKwUoUcrsQ@mail.gmail.com>
References: <CAO=notwzpwtUf63=0yna6eHJgwQWQW8k=FQLtZ5pWKwUoUcrsQ@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18110219-0072-0000-0000-000003C2060E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009973; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01111699; UDB=6.00576136; IPR=6.00891790; 
 MB=3.00024008; MTD=3.00000008; XFM=3.00000015; UTC=2018-11-02 19:05:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110219-0073-0000-0000-000049FA1A1C
Message-Id: <8df19723dd96b88325b20db50092ff9f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-02_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=764 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811020169
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
X-List-Received-Date: Fri, 02 Nov 2018 19:06:01 -0000

On 2018-11-02 14:02, Patrick Venture wrote:
> Hi, I'm looking to see if anyone out there wants to review it as it's
> built, per design here: https://gerrit.openbmc-project.xyz/14444.
> It'll be a fair amount to review in very small patches over a few
> weeks to start with.

Hi Patrick, you can add me to the reviews.

> 
> Patrick

Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W3tR4z8QzDqGl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 10:25:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x03NOTuH102487
 for <openbmc@lists.ozlabs.org>; Thu, 3 Jan 2019 18:25:16 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pssnd5trf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 18:25:16 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Thu, 3 Jan 2019 23:25:15 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Jan 2019 23:25:14 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x03NPDFT26083486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Jan 2019 23:25:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5AF212405A;
 Thu,  3 Jan 2019 23:25:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83A18124058;
 Thu,  3 Jan 2019 23:25:13 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Jan 2019 23:25:13 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Jan 2019 17:30:17 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: openbmc <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: Add links to feature docs - created TOC
In-Reply-To: <07ff326af9b25d021aee58aa650cc986@linux.vnet.ibm.com>
References: <07ff326af9b25d021aee58aa650cc986@linux.vnet.ibm.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19010323-0068-0000-0000-0000037C4337
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010339; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000272; SDB=6.01141340; UDB=6.00594006; IPR=6.00921566; 
 MB=3.00024957; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-03 23:25:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010323-0069-0000-0000-000046FD961B
Message-Id: <18000575353de36c7e0736acb858655f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901030197
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
X-List-Received-Date: Thu, 03 Jan 2019 23:25:20 -0000

On 2018-12-05 17:31, Joseph Reynolds wrote:
> I want to make it easier to find documentation for features of
> OpenBMC.  The README ... file lists the features and links to the docs
> repo, but not all features are documented there, and I'm still new to
> BMCs, so it is hard for me to determine which docs to read.
> 
> I propose to add a link from each feature to its canonical
> documentation.  So if you see me asking question in this area, you'll
> know why.

I changed the OpenBMC feature list into a table of contents for OpenBMC 
features.  The old list needed to be updated and doesn't make it easy to 
find more information about OpenBMC features.  So I looked for docs and 
added links to the project's README.

Please review.
  - Let me know what features should be added or removed, or how to
    organize the list.

  - I tried to find all the feature documentation, but I need your
    help.  Please contribute doc links for your area and I will add them.
    I prefer for each feature to link to a single document, but I will
    take what I can get.

The review is here:
https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/17056/

Thanks!
- Joseph

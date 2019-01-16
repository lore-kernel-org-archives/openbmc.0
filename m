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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g2G54FTKzDqgZ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 09:39:57 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GMYcBn018188
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 17:39:55 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q2946tc32-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 17:39:55 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Wed, 16 Jan 2019 22:39:54 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 16 Jan 2019 22:39:52 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0GMdp5u23330872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Jan 2019 22:39:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9507C605F;
 Wed, 16 Jan 2019 22:39:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 833E3C605B;
 Wed, 16 Jan 2019 22:39:51 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jan 2019 22:39:51 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Jan 2019 16:45:28 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: 2.6 release notes - content?
In-Reply-To: <76efefd3-5fa1-0274-59da-9908858d9b98@gmail.com>
References: <76efefd3-5fa1-0274-59da-9908858d9b98@gmail.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19011622-8235-0000-0000-00000E4C1E6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010420; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01147490; UDB=6.00597735; IPR=6.00927785; 
 MB=3.00025163; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-16 22:39:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011622-8236-0000-0000-0000441BB6F1
Message-Id: <c237a6f7e5e8675e31590630ce7d0baf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901160180
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
X-List-Received-Date: Wed, 16 Jan 2019 22:39:58 -0000

On 2019-01-16 13:03, krtaylor wrote:
> At the last release planning meeting I asked for volunteers to write
> the 2.6 release notes...and instead I got volunteered. So, I'll have a
> go at it, but I need your help.

Thanks Kurt!


> I am going to start with the content in the spreadsheet, so I need the
> release planning reps to ensure that it is current ASAP.
> 
> https://docs.google.com/spreadsheets/d/1lts-YX8J_AnS2dKfhW649OQHijz-JRiJWHTDpKY62Hk/edit?usp=sharing
> 
> We'll be excluding those features that were not completed. I also need
> to include *significant* functionality that was contributed, but not
> listed in the spreadsheet.
> 
> For new content, I need a couple of sentences that describe the
> feature and the benefit, as well as special considerations,
> configuration, limitations, etc. Anything more than a couple of
> paragraphs needs to be documented in the feature/repo readme or in
> docs.

If you would like to review what features OpenBMC supports, or add a 
feature to that list, see the following two reviews.  The first lists 
*major* OpenBMC features in the project README, and the second creates a 
new feature TOC in the docs repo.  The feature TOC attempts to list all 
features and point to their documentation.  Feel free to add review 
comments, and I will handle them.  But be sure to tell Kurt about new 
content.

https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/17056/

https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/17440/


> I am not trying to write the perfect release notes. We can improve the
> process and quality for 2.7.
> 
> So, please check with the spreadsheet, make sure it is current and
> reply here with content pointers or any spreadsheet omissions.
> 
> Thanks everyone!
> Kurt (krtaylor)

Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sp0MN0JmLzDrL7
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 11:35:59 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u940XInJ111640
 for <openbmc@lists.ozlabs.org>; Mon, 3 Oct 2016 20:35:56 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25uy9j5erx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 20:35:56 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 10:35:53 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 10:35:52 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 9F5163578053
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 11:35:51 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u940Zpfs57344176
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 11:35:51 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u940ZpQN030898
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 11:35:51 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u940Zosw030895; Tue, 4 Oct 2016 11:35:51 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 7A441A00BD;
 Tue,  4 Oct 2016 11:35:50 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 3ACB4E3C39;
 Tue,  4 Oct 2016 11:35:50 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 41768942DC1; Tue,  4 Oct 2016 11:36:26 +1100 (AEDT)
Date: Tue, 4 Oct 2016 11:36:26 +1100
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH v2 4.7 0/8] NCSI Fixes
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100400-0004-0000-0000-000001A1DA21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100400-0005-0000-0000-000008CFAEDD
Message-Id: <20161004003626.GA309@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-03_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610040008
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
X-List-Received-Date: Tue, 04 Oct 2016 00:36:00 -0000

On Thu, Sep 29, 2016 at 11:38:43AM +1000, Gavin Shan wrote:
>

Joel, please hold merging this series because I try pushing this series
upstream firstly. It's always good to keep code sync'ed between 4.7.x
with upstream regarding NCSI stack. I will post a updated version if
it can be upstream in time. Thanks again for your review and comments.

Thanks,
Gavin

>Gavin Shan (8):
>  net/ncsi: Avoid unused-value build warning from ia64-linux-gcc
>  net/ncsi: Introduce NCSI_RESERVED_CHANNEL
>  net/ncsi: Don't probe on the reserved channel ID (0x1f)
>  net/ncsi: Rework request index allocation
>  net/ncsi: Allow to extend NCSI request properties
>  net/ncsi: Rework the channel monitoring
>  net/ncsi: Introduce ncsi_stop_dev()
>  net/faraday: Stop NCSI device on shutdown
>
> drivers/net/ethernet/faraday/ftgmac100.c |   2 +
> include/net/ncsi.h                       |   5 +
> net/ncsi/internal.h                      |  22 ++--
> net/ncsi/ncsi-aen.c                      |  19 ++--
> net/ncsi/ncsi-cmd.c                      |   2 +-
> net/ncsi/ncsi-manage.c                   | 166 ++++++++++++++++++-------------
> net/ncsi/ncsi-rsp.c                      |  17 +---
> 7 files changed, 137 insertions(+), 96 deletions(-)
>
>-- 
>2.1.0
>

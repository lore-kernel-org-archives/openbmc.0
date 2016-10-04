Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spGm633W1zDrFn
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:24:54 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u94BNQn4069507
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 07:24:52 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25uy9qy6bc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2016 07:24:51 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 4 Oct 2016 21:24:49 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 4 Oct 2016 21:24:47 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 6B38A2CE8054
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 22:24:47 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u94BOlvU42664062
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:24:47 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u94BOkfi012139
 for <openbmc@lists.ozlabs.org>; Tue, 4 Oct 2016 22:24:47 +1100
Received: from gwshan ([9.192.182.193])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u94BOk4U012132; Tue, 4 Oct 2016 22:24:46 +1100
Received: by gwshan (Postfix, from userid 1000)
 id 5422A9431E9; Tue,  4 Oct 2016 22:25:17 +1100 (AEDT)
Date: Tue, 4 Oct 2016 22:25:17 +1100
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 4.7 0/8] NCSI Fixes
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <20161004003626.GA309@gwshan>
 <CACPK8Xcx7vNOsT6rdLYVJQHwvN6yFyrogOhpPyczU1jMQ8r2rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xcx7vNOsT6rdLYVJQHwvN6yFyrogOhpPyczU1jMQ8r2rw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100411-0016-0000-0000-000001D9D291
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100411-0017-0000-0000-000005915033
Message-Id: <20161004112517.GA27235@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610040200
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
X-List-Received-Date: Tue, 04 Oct 2016 11:24:54 -0000

On Tue, Oct 04, 2016 at 03:58:58PM +1030, Joel Stanley wrote:
>On Tue, Oct 4, 2016 at 11:06 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> On Thu, Sep 29, 2016 at 11:38:43AM +1000, Gavin Shan wrote:
>>>
>>
>> Joel, please hold merging this series because I try pushing this series
>> upstream firstly. It's always good to keep code sync'ed between 4.7.x
>> with upstream regarding NCSI stack. I will post a updated version if
>> it can be upstream in time. Thanks again for your review and comments.
>
>Okay, will do. Thanks Gavin.
>

Thanks, Joel. v3, merged to linux.net ("next" branch), was just posted.
Please consider merging it to 4.7 branch :)

Thanks,
Gavin

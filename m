Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpN974KH7zDrKJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 13:29:30 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v883SgBo141975
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 23:29:27 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cua3sam0f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 23:29:27 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 8 Sep 2017 13:29:24 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 8 Sep 2017 13:29:22 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v883TMU036831482
 for <openbmc@lists.ozlabs.org>; Fri, 8 Sep 2017 13:29:22 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v883TLIf007244
 for <openbmc@lists.ozlabs.org>; Fri, 8 Sep 2017 13:29:22 +1000
Received: from Deepaks-MacBook-Pro.local ([9.78.195.22])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v883TJ6W007212; Fri, 8 Sep 2017 13:29:20 +1000
Subject: Re: RFC for Telemetry data collection
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <D3C20289-0D8A-4485-BB2B-6D6519B99A0A@fuzziesquirrel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 8 Sep 2017 08:59:19 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <D3C20289-0D8A-4485-BB2B-6D6519B99A0A@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
x-cbid: 17090803-0008-0000-0000-000001570C2F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090803-0009-0000-0000-0000098B0CD3
Message-Id: <3c810047-cb4e-465b-6373-900a484ed078@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-08_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709080053
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
X-List-Received-Date: Fri, 08 Sep 2017 03:29:32 -0000

On 08/09/17 6:46 am, Brad Bishop wrote:
> Hi Tom
> 
> I don’t really disagree with anything you wrote…I’m just throwing out some additional thoughts.
> 
> I would propose that we:
> 
> 1 - Add support to the REST server to subscribe to DBus signals, and simply forward the signal content in JSON format out over a websocket.  This allows an external user to get any async notification that any code running on the BMC can get.  I have a lot of questions on specifics here but I’ll save those for later, in case this doesn’t work out.

Brad, that sounds fine to me in terms of how a notification can be sent, 
although Tom's proposal also talked about describing in yaml, how 
frequently to read something off of a, say a d-bus object representing a 
sensor. If I understood correctly, are you saying instead of doing this 
every X hours or seconds, we send out a notification whenever a 
PropertyChanged d-bus signal is caught? And let an off-BMC application 
bother about averages, min/max?


Regards,
Deepak

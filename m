Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Vwr12p9GzDqDf
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 05:07:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x03I4XPu011138
 for <openbmc@lists.ozlabs.org>; Thu, 3 Jan 2019 13:07:39 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2psq1srxaf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 13:07:39 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 3 Jan 2019 18:07:38 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Jan 2019 18:07:35 -0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x03I7YVA18219070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Jan 2019 18:07:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE91178069;
 Thu,  3 Jan 2019 18:07:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F7CE7805E;
 Thu,  3 Jan 2019 18:07:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Jan 2019 18:07:34 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 03 Jan 2019 12:12:38 -0600
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Patrick Venture <venture@google.com>
Cc: Yong Li <yong.b.li@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: journal log messages are missing with latest version
In-Reply-To: <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19010318-0012-0000-0000-000016F350FB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010338; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000272; SDB=6.01141235; UDB=6.00593942; IPR=6.00921460; 
 MB=3.00024956; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-03 18:07:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010318-0013-0000-0000-000055ACFEFB
Message-Id: <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901030159
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
X-List-Received-Date: Thu, 03 Jan 2019 18:07:45 -0000

On 2019-01-02 13:09, Patrick Venture wrote:
> On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com> 
> wrote:
>> 
>> 
>> 
>> Hi Patrick,
>> 
>> 
>> 
>> I encountered a problem after upgrade to the latest opnebmc version:
>> 
>> 
>> 
>> These log messages in ipmid are missing with the “journalctl -f”.
> 
> Which log messages?


This showed up on all of our systems too, anything logged using 
phosphor-logging
is missing from the journal.  I even ended up using a git bisect to also 
narrow
it down to:

phosphor-logging: srcrev bump 30047bf964..31552c05e2

     Patrick Venture (5):
           add sdjournal interface to inject tests
           test: use only one main library
           bugfix: add fixes to mock class
           bugfix: rename method to match implementation
           test: add test to force building of sdjournal mock


> 
>> 
>> 
>> 
>> My tests shows that the blow change is related, after I revert it, I 
>> can get these log messages.
>> 
>> 
>> 
>> Did you meet such issue, or any suggestions/comments to narrow down 
>> this issue?
>> 
>> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066baa6f3711c88d6a3b9a5c4d49
>> 
>> add sdjournal interface to inject tests
> 
> There were some follow-on patches for phosphor-logging that you
> shouldn't need -- it's
> 
> What SHA is for your https://github.com/openbmc/phosphor-host-ipmid ?
> (so I know what version of that is in use by you).
> 
> Checking the HEAD version of
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile.am,
> I see it's including the proper libs to get the full phosphor-logging
> objects.
> 
>> 
>> 
>> 
>> Thanks,
>> 
>> Yong

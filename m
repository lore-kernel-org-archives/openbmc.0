Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpPmG1Nj8zDqyX
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 11:40:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6C1Y24p141538
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 21:40:11 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 243eucygwm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 21:40:10 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jul 2016 19:40:10 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jul 2016 19:40:07 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 4E60219D8051;
 Mon, 11 Jul 2016 19:39:43 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6C1e65B41615570; Mon, 11 Jul 2016 18:40:06 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85EFB6A043;
 Mon, 11 Jul 2016 19:40:06 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.193.179])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP id 367BB6A03C;
 Mon, 11 Jul 2016 19:40:05 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 65AED229DB30; Tue, 12 Jul 2016 11:39:59 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 skiboot list <skiboot@lists.ozlabs.org>
Subject: Re: [PATCH openbmc 3/3] meta-openpower: Update pflash version
In-Reply-To: <20160711215731.GB12483@asimov.austin.ibm.com>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
 <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
 <20160630212709.GV20922@asimov.austin.ibm.com>
 <CACPK8XdYZrNXFrxp2beXwWKrORCApWtSh+1LRG+qOrd_DHvz-g@mail.gmail.com>
 <20160711215731.GB12483@asimov.austin.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.0.94.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jul 2016 11:39:59 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16071201-0020-0000-0000-0000094C8965
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16071201-0021-0000-0000-00005399D24D
Message-Id: <87a8hnskgg.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-12_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607120014
X-Mailman-Approved-At: Tue, 12 Jul 2016 20:09:33 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2016 01:40:14 -0000

Patrick Williams <patrick@stwcx.xyz> writes:
> Stewart,
>
> Bump.  Didn't see a reply from you on this.

Thanks, I somehow missed it.

> On Fri, Jul 01, 2016 at 10:23:24AM +0930, Joel Stanley wrote:
>> On Fri, Jul 1, 2016 at 6:57 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> > On Thu, Jun 30, 2016 at 11:20:33AM -0500, OpenBMC Patches wrote:
>> >> From: Joel Stanley <joel@jms.id.au>
>> >>
>> >> Move to HEAD so we can drop the patches we carry.
>> >>
>> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> >
>> > Stewart released 5.2.3 with these fixes.  Can you put us onto that
>> > instead?  Prefer to stay on a released version rather than a commit.
>> 
>> It was my intention to bump us to 5.2.3. However, I went and looked at
>> the recipe and we were carrying 7 patches against skiboot. Only the
>> 7th is on the stable branch.
>> 
>> Stewart,
>> 
>> I assume you don't want to tag master at all?
>> 
>> If not, can you please pull this list of commits into the stable branch:
>> 
>>  e42206bf0729782330778e77283af2aca23499dc
>>  7c7911eb7bea505474c3062bf5b0c60d99b502a5
>>  e5fc583e610d4360f8fe50f225c868cb3019c1a7
>>  e415b3b9bf0441745f442e12bfce25ed49c589bf
>>  45e548176e16ad8ba9540fcd75131ba4993e42b7
>>  24ae270984a37525f8393eeccbd0ac55da4503e1
>> 
>> They are all related to building pflash.

Done. Also cherry picked 2ebc0ae0a2c61c006062ba42fc253296060c34cf as it
had Fixes:e42206bf0729782330778e77283af2aca23499dc in it.

I can tag a 5.2.4 with these bits in it today if you like too.

-- 
Stewart Smith
OPAL Architect, IBM.

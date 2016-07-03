Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rhzSS6B46zDqnK
 for <openbmc@lists.ozlabs.org>; Sun,  3 Jul 2016 15:37:44 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u635Xo98145782
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 01:37:42 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23x7rtsgqv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jul 2016 01:37:42 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Sun, 3 Jul 2016 15:37:39 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 3 Jul 2016 15:37:38 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id D84A32BB0059
 for <openbmc@lists.ozlabs.org>; Sun,  3 Jul 2016 15:37:37 +1000 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u635bbWV41943138
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 15:37:37 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u635bbYl029057
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 15:37:37 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u635bb3M029052; Sun, 3 Jul 2016 15:37:37 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D8423A00AB;
 Sun,  3 Jul 2016 15:37:36 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id BF1B4E3B49;
 Sun,  3 Jul 2016 15:37:36 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id AE051942D17; Sun,  3 Jul 2016 15:37:36 +1000 (AEST)
Date: Sun, 3 Jul 2016 15:37:36 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 08/10] net/farady: Support NCSI mode
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-9-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xeh12tWRvoQ=b32qj+78PPOMEO9+rEvL-X03ZrK_WVh-Q@mail.gmail.com>
 <1467372416.7422.42.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467372416.7422.42.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16070305-0048-0000-0000-0000019BE27E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16070305-0049-0000-0000-00004610F0A8
Message-Id: <20160703053736.GB9530@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607030062
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
X-List-Received-Date: Sun, 03 Jul 2016 05:37:45 -0000

On Fri, Jul 01, 2016 at 09:26:56PM +1000, Benjamin Herrenschmidt wrote:
>On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:
>> We get this message whenever the device is brought up or down. This
>> includes when the host reboots, filling up the bmc's kernel logs.
>> 
>> However, when we had the timer race it was the only way to know what
>> was going on. Can we detect when it's the host bringing the device
>> down opposed to an "ifconfig up" failing to bring it up?
>
>What would be nice would be if we could mirror that into the "carrier"
>state of the interface (which normally corresponds to the PHY link
>state).
>
>The problem however is that when the carrier is off, the network stack
>will ditch packets, which doen't work for us since we still need to
>talk NSCI ...
>
>I'm thinking we should create some netdev flags so that the generic
>link monitor stops bringing it down in that case. That way we can
>set the carrier and eixsting stuff that knows how to read and interpret
>it will work.
>

Ben and Joel, thank you very much for your comments. I'm sorry this comment
isn't covered in the revision I sent to community just. I will evaluate it
later and improve it accordingly. Note this is the only comment not covered
in the revision sent to community, all other comments should be covered there
if I didn't miss any of them.

Thanks,
Gavin

>Cheers,
>Ben.
>

Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D0CA31A0D59
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:21:03 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 21:21:02 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 21:21:00 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9B1A119D8026
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 21:09:01 -0700 (MST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C4KxBh27590752
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 04:20:59 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C4KxpQ018220
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 23:20:59 -0500
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.230])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C4KmHf017561; Mon, 11 Jan 2016 23:20:58 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id F3F9D22B7CFE; Tue, 12 Jan 2016 15:20:46 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc-test-automation 05/60] added testcase for etc
 passwd
In-Reply-To: <1452531026-13715-6-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452531026-13715-6-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 15:20:46 +1100
Message-ID: <8737u3e8dd.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011204-0005-0000-0000-00001B5A3498
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 04:21:04 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: manjunath <manjunath@localhost.localdomain>

and again, needs valid email addr

-- 
Stewart Smith
OPAL Architect, IBM.

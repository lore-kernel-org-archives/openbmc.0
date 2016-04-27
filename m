Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvjtG1wCZzDq5s
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 12:03:34 +1000 (AEST)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 26 Apr 2016 20:03:32 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 26 Apr 2016 20:03:30 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 2BDD41FF005D
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 20:03:15 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3R23T2246268508
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 19:03:29 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3R23TQd021103
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 20:03:29 -0600
Received: from birb.localdomain (birb.au.ibm.com [9.185.32.142])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3R23SGP021044; Tue, 26 Apr 2016 20:03:29 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 31CAF2286E21; Wed, 27 Apr 2016 10:46:58 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 1/4] pflash: Add pflash recipe
In-Reply-To: <1460737833-13353-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460737833-13353-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 27 Apr 2016 10:46:58 +1000
Message-ID: <87k2jjkhdp.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042702-8236-0000-0000-000029B6081C
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
X-List-Received-Date: Wed, 27 Apr 2016 02:03:34 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>  .../0001-pflash-Allow-building-under-yocto.patch   | 98
>  ++++++++++++++++++++++

FYI, this patch won't be needed with the very-soon-to-be-tagged skiboot
5.2.1.

-- 
Stewart Smith
OPAL Architect, IBM.

Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7MQc1vzxzDq5y
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 10:53:28 +1000 (AEST)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 15 May 2016 18:53:25 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 15 May 2016 18:53:22 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org;openbmc-patches@stwcx.xyz
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0D12319D8040;
 Sun, 15 May 2016 18:53:05 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4G0rMTa41287682; Sun, 15 May 2016 17:53:22 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32817C603C;
 Sun, 15 May 2016 18:53:22 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.16.55])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id B95CDC6037;
 Sun, 15 May 2016 18:53:21 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9D0D42298E58; Mon, 16 May 2016 10:53:15 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@us.ibm.com>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser] Increase size of buffer length variable
In-Reply-To: <201605131351.u4DDpf9u004682@d01av01.pok.ibm.com>
References: <1463080219-26647-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463080219-26647-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201605131351.u4DDpf9u004682@d01av01.pok.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 16 May 2016 10:53:15 +1000
Message-ID: <87d1om3jt0.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051600-0021-0000-0000-00004EDB36C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Mon, 16 May 2016 00:53:28 -0000

Adriana Kobylak <anoo@us.ibm.com> writes:
> The size of size_t is different in 32 and 64-bit architectures. There has 
> been issues in the past in op-build where we had to change size_t to 
> uint32_t to support compiling in 64-bit. So thought I'd make the change 
> consistent and change the length to uint32_t.

If size_t is part of a binary format, then yes, this matters.

Otherwise, it really shouldn't - addressing things >2GB on 32bit systems
is going to be problematic anyway, and all that really should matter
there is off_t vs off64_t if you're doing seeking in large files.


So what exactly is the problem with size_t here?

-- 
Stewart Smith
OPAL Architect, IBM.

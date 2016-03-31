Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qbDdD5Gb9zDq5v
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 17:10:08 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 31 Mar 2016 00:10:06 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Mar 2016 00:10:05 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 4287919D85BE
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 23:50:30 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2V62b6N35848436
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 23:02:37 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2V62aF9018843
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 00:02:36 -0600
Received: from birb.localdomain ([9.83.7.76])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u2V62QcQ018048
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 00:02:35 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 36EB62298E5D; Thu, 31 Mar 2016 17:02:23 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: obmcutil is slow, nonsensical output
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 31 Mar 2016 17:02:23 +1100
Message-ID: <87wpojtcb4.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16033106-0017-0000-0000-00001C081031
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
X-List-Received-Date: Thu, 31 Mar 2016 06:10:09 -0000

root@palmetto:~# time obmcutil 2>&1 > /dev/null

real    0m3.301s
user    0m3.030s
sys     0m0.230s

root@palmetto:~# obmcutil poweron
 = None

The above is really confusing as to what is actually going on... does
that mean success? Does that mean there's no power? Does that mean no
action was taken?


-- 
Stewart Smith
OPAL Architect, IBM.

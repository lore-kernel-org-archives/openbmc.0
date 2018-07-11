Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qlgf2L5VzDqx6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 03:00:30 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2018 09:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="71930595"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga001.jf.intel.com with ESMTP; 11 Jul 2018 09:59:17 -0700
Date: Wed, 11 Jul 2018 09:59:17 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>
Subject: ipmitool default interface
Message-ID: <20180711165917.GH105329@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 17:00:33 -0000

I have seen several requests for help on this list that could have been 
avoided if the BMC internal ipmitool used dbus as its default interface. 

I do not think we are quite ready to upstream this commit or the actual 
interface, since the dbus interface will be changing as part of the 
refactor of ipmid's architecture. But for now, it makes sense to set the 
default interface as dbus.

After I have finished working on the refactor, I will push the changes 
upstream and then we should be able to just run with a standard 
cross-compiled build of ipmitool.

--Vernon

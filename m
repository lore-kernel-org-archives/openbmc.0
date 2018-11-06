Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42psHr05GJzF36B
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 12:23:18 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <ecff1259e9b45aeac3d2799515719f18aef788f0.camel@fuzziesquirrel.com>
Subject: Re: REST authentication
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ping Mao <pmao@linkedin.com>
Cc: openbmc@lists.ozlabs.org, mspinler@linux.vnet.ibm.com, "Tanous, Ed"
 <ed.tanous@intel.com>
Date: Mon, 05 Nov 2018 20:23:14 -0500
In-Reply-To: <D8D43392-F0D8-44FA-8CA1-68FAC58DA8A8@linkedin.biz>
References: <D8D43392-F0D8-44FA-8CA1-68FAC58DA8A8@linkedin.biz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 06 Nov 2018 01:23:20 -0000

Hi Ping

On Mon, 2018-10-29 at 23:21 +0000, Ping Mao wrote:
> Hi,   Brad:
> 
> I have some questions about REST API framework and
> authentication,     what framework does OpenBMC use for REST
> APIs?   And what REST Authentication mechanism is used?
> 
> Thanks,
> Ping


There are two rest stacks in OpenBMC at the moment:

https://github.com/openbmc/phosphor-rest-server
https://github.com/openbmc/bmcweb

You should know that the main contributors to phosphor-rest-server are
in the process of moving off that stack and onto bmcweb.  So I won't
talk about phosphor-rest-server unless you have some specific desire to
hear about it.

I'm not up to speed on how bmcweb handles authentication or what
frameworks it uses so I'll add some folks to CC that might be able to
help.

-brad

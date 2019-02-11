Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ywJY3J5gzDqTs
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 06:07:09 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 11 Feb 2019 14:07:38 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: New repo request
Message-ID: <20190211190738.l6dx7w2akay34w53@thinkpad.dyn.fuzziesquirrel.com>
References: <AA5BE1BA-F0FE-452E-B935-989AE8C14AC0@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <AA5BE1BA-F0FE-452E-B935-989AE8C14AC0@fb.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 19:07:09 -0000

On Thu, Feb 07, 2019 at 06:40:41PM +0000, Vijay Khemka wrote:
>Hi Brad,
>We need a new repo fb-ipmi-oem for facebook oem IPMI message handling. Please let me know what are basic steps I need to follow.
>
>Regards
>-Vijay

Hi Vijay

I've created openbmc/fb-ipmi-oem.  Have fun.

thx - brad

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LgGm6bm2zF37k
 for <openbmc@lists.ozlabs.org>; Fri, 28 Sep 2018 02:28:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id AD38D1291ED;
 Thu, 27 Sep 2018 12:28:28 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH linux dev-4.18] arm: dts: aspeed: Use ColdFire FSI offload
 on Witherspoon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180927064651.3118-1-andrew@aj.id.au>
Date: Thu, 27 Sep 2018 12:28:28 -0400
Cc: joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <81979977-2E26-4276-9991-C7FD28125135@fuzziesquirrel.com>
References: <20180927064651.3118-1-andrew@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Thu, 27 Sep 2018 16:28:33 -0000



> On Sep 27, 2018, at 2:46 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

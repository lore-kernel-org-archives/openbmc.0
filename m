Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKnKn0XqQzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 07:56:12 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v1AKtuSU023180;
 Fri, 10 Feb 2017 14:55:58 -0600
Message-ID: <1486760156.3401.47.camel@kernel.crashing.org>
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>, Cyril Bur <cyrilbur@gmail.com>
Cc: linux-kernel@vger.kernel.org, mikey@neuling.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Date: Sat, 11 Feb 2017 07:55:56 +1100
In-Reply-To: <20170210143012.GB18321@kroah.com>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
 <20170210143012.GB18321@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2017 20:56:13 -0000

On Fri, 2017-02-10 at 15:30 +0100, Greg KH wrote:
> 
> Without some other reviewed-by: or at least tested-by lines here, I'm
> not going to take this.  Go poke your fellow ppc people to do some
> work
> here, it shouldn't be up to me to do it for them :(

We are reviewing it ;-) We asked for a change in the reading of
the DT "reg" property (he should use the appropriate helpers rather
than do it by hand). I'll send my reviewed-by once that has been
addressed.

Cheers,
Ben.

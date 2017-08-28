Return-Path: <tklauser@sym2.noone.org>
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xglVH42zGzDqMM
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 18:36:23 +1000 (AEST)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 3xglV41YgNz1t0xD; Mon, 28 Aug 2017 10:36:12 +0200 (CEST)
Date: Mon, 28 Aug 2017 10:36:11 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 linux-serial@vger.kernel.org, mec@shout.net, vadimp@maellanox.com,
 system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v6 3/3] Doccumentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
Message-ID: <20170828083610.GB1951@distanz.ch>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <1503418256-5215-4-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503418256-5215-4-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 28 Aug 2017 08:36:23 -0000

On 2017-08-22 at 18:10:56 +0200, Oleksandr Shamray <oleksandrs@mellanox.com> wrote:
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v5->v6
> Comments pointed by Tobias Klauser <tklauser@distanz.ch>
> - Small nit: s/doccumentation/Documentation/

There's still one 'c' too many in 'Doccumentation' in the subject (in
case you're doing another respin of the series).

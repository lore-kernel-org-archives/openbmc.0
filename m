Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKnPg0NfkzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 07:59:34 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v1AKxMCq023496;
 Fri, 10 Feb 2017 14:59:23 -0600
Message-ID: <1486760361.3401.48.camel@kernel.crashing.org>
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Cc: mikey@neuling.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Sat, 11 Feb 2017 07:59:21 +1100
In-Reply-To: <20170207234247.19425-1-cyrilbur@gmail.com>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
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
X-List-Received-Date: Fri, 10 Feb 2017 20:59:35 -0000

On Wed, 2017-02-08 at 10:42 +1100, Cyril Bur wrote:
> +struct aspeed_lpc_ctrl_mapping {
> +       __u8    window_type;
> +       __u8    window_id;
> +       __u16   flags;
> +       __u32   addr;
> +       __u32   offset;
> +       __u32   size;
> +};
> +

Please document the fields

Cheers,
Ben.

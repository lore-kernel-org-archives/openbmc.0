Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGlMB6xTyzDqnQ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 21:17:58 +1100 (AEDT)
Received: from localhost (unknown [37.170.134.120])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id C7DA0F9B;
 Wed, 10 Jan 2018 10:17:55 +0000 (UTC)
Date: Wed, 10 Jan 2018 11:17:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
Message-ID: <20180110101755.GA5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 10:17:59 -0000

On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> 
> Hello,
> 
> This patch set provides support for PECI of AST2400/2500 which can give us PECI
> functionalities such as temperature monitoring, platform manageability,
> processor diagnostics and failure analysis. Also provides generic peci.h and
> peci_ioctl.h headers to provide compatibility to peci drivers that can be
> implemented later e.g. Nuvoton's BMC SoC family.

What is the "dev-4.10" in the subject for?  4.10 is really old and
obsolete :(

thanks,

greg k-h

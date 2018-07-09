Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PHcQ18ZRzDqBm;
 Mon,  9 Jul 2018 17:52:37 +1000 (AEST)
Received: from localhost (unknown [46.44.180.42])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 7B67193C;
 Mon,  9 Jul 2018 07:52:35 +0000 (UTC)
Date: Mon, 9 Jul 2018 09:52:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Fair <benjaminfair@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, Robert Lippert <rlippert@google.com>,
 Patrick Venture <venture@google.com>
Subject: Re: [PATCH] drivers/misc: Aspeed LPC snoop output using misc chardev
Message-ID: <20180709075233.GF13479@kroah.com>
References: <20180706182531.137362-1-benjaminfair@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180706182531.137362-1-benjaminfair@google.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
X-List-Received-Date: Mon, 09 Jul 2018 07:52:38 -0000

On Fri, Jul 06, 2018 at 11:25:32AM -0700, Benjamin Fair wrote:
> From: Robert Lippert <rlippert@google.com>
> 
> Provides the data bytes snooped over the LPC snoop bus to userspace
> as a (blocking) misc character device.

If this is a debugging thing, why not just use debugfs instead of a char
device?  That should make this code simpler overall, and you can do
whatever you want with debugfs.

thanks,

greg k-h

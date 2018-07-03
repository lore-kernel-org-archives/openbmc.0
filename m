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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Kml75q7pzF1MY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 00:31:14 +1000 (AEST)
Received: from localhost (unknown [213.138.59.42])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 94C95E3B;
 Tue,  3 Jul 2018 14:31:11 +0000 (UTC)
Date: Tue, 3 Jul 2018 16:31:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 Eugene.Cho@dell.com, a.amelkin@yadro.com, stewart@linux.ibm.com,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/4] dts: misc: Add bindings documentation for
 bmc-misc-ctrl
Message-ID: <20180703143109.GB2043@kroah.com>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-2-andrew@aj.id.au>
 <20180703075009.GA27649@kroah.com>
 <a1c3ecd4fed28e2b33c95a476452318dba58cd7e.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c3ecd4fed28e2b33c95a476452318dba58cd7e.camel@kernel.crashing.org>
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
X-List-Received-Date: Tue, 03 Jul 2018 14:31:16 -0000

On Wed, Jul 04, 2018 at 12:16:49AM +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2018-07-03 at 09:50 +0200, Greg KH wrote:
> > On Tue, Jul 03, 2018 at 05:04:10PM +1000, Andrew Jeffery wrote:
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > 
> > I can't take patches without any changelog text at all :(
> 
> Greg (and replying to your other comments as well)...
> 
> This is an RFC series, it's not meant for you to take at this point,
> it's about discussing the overall approach to exposing BMC random
> "tunables" as explained in patch 0 of the series.
> 
> Yes the individual patches aren't yet at the level of polish for a
> formal submission, we (naively ?) thought that's what the whole RFC tag
> is about :-)

Oh come on, putting a basic "here is what this patch does" comment
should be part of every patch, otherwise what is there to comment on if
we don't know what is going on in the patch itself?

Anyway, I provided a bunch of feedback to the "real" patch in this
series...


greg k-h

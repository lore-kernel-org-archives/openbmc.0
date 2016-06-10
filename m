Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR4M11McfzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 00:29:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=KVKj8U2Y; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 0B25125D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465568987;
 bh=RKqAUBRa3MR4Jdtr296BQ+YkUQ2tXNZDr6UTiLIhY4g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KVKj8U2YLu6pvZkS8IsRO5+JQ/wWdCIE+5GnnrEp2TNKvKf38VDXeC90WMAA0T7uW
 Rp1HlMTynrHqBD9Pro3uN45suXeKfrZqPE0HxHz6SwVZKuNMa0X0ugtg7AqEhRDh5C
 q8y35J+V80Xk41gDq/BXNkTlwQbWzUwJTErL2G14=
Message-ID: <1465568984.10360.3.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc v2 11/11] AST2500: Add AST2500 evaluation board
 layer
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2016 10:29:44 -0400
In-Reply-To: <CACPK8XdK5VrdeurtWzNSAXDxNiCeAv5HdYNp7OPAgrY2HYR1wQ@mail.gmail.com>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-12-openbmc-patches@stwcx.xyz>
 <CACPK8XdK5VrdeurtWzNSAXDxNiCeAv5HdYNp7OPAgrY2HYR1wQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 14:29:49 -0000

On Wed, 2016-06-08 at 19:40 -0500, Joel Stanley wrote:
> On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > The AST2500 is an ARM SOC made by Aspeed.
> >
> > This layer is a stub; there are a couple missing bits of support
> > from the kernel and u-boot.
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >  meta-openbmc-machines/meta-evb/conf/layer.conf     |  5 ++++
> >  .../meta-evb/meta-evb-aspeed/conf/layer.conf       |  5 ++++
> >  .../meta-evb-ast2500/conf/bblayers.conf.sample     | 27 ++++++++++++++++++++++
> >  .../meta-evb-ast2500/conf/conf-notes.txt           |  2 ++
> >  .../meta-evb-ast2500/conf/layer.conf               |  5 ++++
> >  .../meta-evb-ast2500/conf/local.conf.sample        | 21 +++++++++++++++++
> >  .../meta-evb-ast2500/conf/machine/ast2500-evb.conf |  6 +++++
> >  7 files changed, 71 insertions(+)
> >  create mode 100644 meta-openbmc-machines/meta-evb/conf/layer.conf
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> >  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> 
> meta-evb/meta-evb-aspeed/meta-evb-ast2500?
> 
> Too meta I think. Perhaps drop the middle level?

At the moment I'd vote for consistancy over being too verbose:

meta-openpower/meta-ibm/meta-palmetto ->
meta-<what>/meta-<company>/meta-<board>

so I was just doing the same thing we already do.  As far as the actual
use of 'meta' this is best practice for any oe layer.

Can certainly rethink this in the long run.

> 
> Also, the filenames are ast2500-evb but the path is evb-ast2500. Is
> this intentional?

Ok, will reverse the machine name.

> 
> >
> > diff --git a/meta-openbmc-machines/meta-evb/conf/layer.conf b/meta-openbmc-machines/meta-evb/conf/layer.conf
> > new file mode 100644
> > index 0000000..f8f2d0e
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/conf/layer.conf
> > @@ -0,0 +1,5 @@
> > +# We have a conf and classes directory, add to BBPATH
> > +BBPATH .= ":${LAYERDIR}"
> > +
> > +BBFILE_COLLECTIONS += "evb"
> > +BBFILE_PATTERN_evb = ""
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> > new file mode 100644
> > index 0000000..6d78f95
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> > @@ -0,0 +1,5 @@
> > +# We have a conf and classes directory, add to BBPATH
> > +BBPATH .= ":${LAYERDIR}"
> > +
> > +BBFILE_COLLECTIONS += "evb-aspeed"
> > +BBFILE_PATTERN_evb-aspeed = ""
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> > new file mode 100644
> > index 0000000..dee1fa1
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> > @@ -0,0 +1,27 @@
> > +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> > +# changes incompatibly
> > +LCONF_VERSION = "6"
> > +
> > +BBPATH = "${TOPDIR}"
> > +BBFILES ?= ""
> > +
> > +BBLAYERS ?= " \
> > +  ##OEROOT##/meta \
> > +  ##OEROOT##/meta-yocto \
> > +  ##OEROOT##/meta-phosphor \
> > +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> > +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> > +  "
> > +BBLAYERS_NON_REMOVABLE ?= " \
> > +  ##OEROOT##/meta \
> > +  ##OEROOT##/meta-yocto \
> > +  ##OEROOT##/meta-phosphor \
> > +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> > +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> > +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> > +  "
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> > new file mode 100644
> > index 0000000..9b3c01a
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> > @@ -0,0 +1,2 @@
> > +Common targets are:
> > +     obmc-phosphor-image
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> > new file mode 100644
> > index 0000000..1c70336
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> > @@ -0,0 +1,5 @@
> > +# We have a conf and classes directory, add to BBPATH
> > +BBPATH .= ":${LAYERDIR}"
> > +
> > +BBFILE_COLLECTIONS += "evb-ast2500"
> > +BBFILE_PATTERN_evb-ast2500 = ""
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> > new file mode 100644
> > index 0000000..58e165f
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> > @@ -0,0 +1,21 @@
> > +MACHINE ??= "ast2500-evb"
> > +DISTRO ?= "openbmc-phosphor"
> > +PACKAGE_CLASSES ?= "package_rpm"
> > +SANITY_TESTED_DISTROS_append ?= " *"
> > +EXTRA_IMAGE_FEATURES = "debug-tweaks"
> > +USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> > +PATCHRESOLVE = "noop"
> > +BB_DISKMON_DIRS = "\
> > +    STOPTASKS,${TMPDIR},1G,100K \
> > +    STOPTASKS,${DL_DIR},1G,100K \
> > +    STOPTASKS,${SSTATE_DIR},1G,100K \
> > +    STOPTASKS,/tmp,100M,100K \
> > +    ABORT,${TMPDIR},100M,1K \
> > +    ABORT,${DL_DIR},100M,1K \
> > +    ABORT,${SSTATE_DIR},100M,1K \
> > +    ABORT,/tmp,10M,1K"
> > +CONF_VERSION = "1"
> > +INHERIT += "extrausers"
> > +EXTRA_USERS_PARAMS = " \
> > +  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
> > +  "
> > diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> > new file mode 100644
> > index 0000000..559e2b6
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> > @@ -0,0 +1,6 @@
> > +KMACHINE = "aspeed"
> > +KERNEL_DEVICETREE = "${KMACHINE}-ast2500-evb.dtb"
> > +
> > +require conf/machine/include/ast2500.inc
> > +require conf/machine/include/obmc-bsp-common.inc
> > +require conf/machine/include/sample.inc
> > --
> > 2.8.3
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc

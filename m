Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR4Ns0ZtKzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 00:31:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=xKkumWwn; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com F0C7825E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465569083;
 bh=WsmfB4/6fp7BmhAiKq9Kr0UtItVelj1qMtRdWfsIAoc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=xKkumWwnTnfyXe1TqnRVirdeHYS4tB51k9oGST8fN7hKWBAe3bsAlyIsCUJXIXjrA
 Ad5D08fIxXdTFY/a/MD0eQMO3ZElDSAZKmY0vAFoORDFZLsOH9ziS3tArCeTh7j7qv
 16uEUxefhpYzOXD0XaqG5Xj04Y56RR5LjoaJFQgE=
Message-ID: <1465569079.10360.5.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc v2 04/11] Remove duplicate kernel config fragments
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2016 10:31:19 -0400
In-Reply-To: <CACPK8Xcu=mRcFtDppDMtW8Wwnd-uBCKeHSc4FRhXmghA3cTQ9A@mail.gmail.com>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-5-openbmc-patches@stwcx.xyz>
 <CACPK8Xcu=mRcFtDppDMtW8Wwnd-uBCKeHSc4FRhXmghA3cTQ9A@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 Jun 2016 14:31:25 -0000

On Wed, 2016-06-08 at 19:42 -0500, Joel Stanley wrote:
> On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > Enable CONFIG_HWMON and nothing else in the base Phosphor layer.
> > Enable system specific modules in their respective layers.
> 
> I thought we agreed that we should put the CONFIG_HWMON in the
> respective layers too?

Oops.  Forgot.  Or was I trying to sneak it by?

Will fix.

> 
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >  .../meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg            | 4 ----
> >  .../meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend           | 2 +-
> >  .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg      | 3 ---
> >  .../meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg        | 3 ---
> >  .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg        | 1 -
> >  .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg      | 3 +++
> >  .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend         | 2 ++
> >  meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg        | 1 +
> >  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb           | 1 +
> >  9 files changed, 8 insertions(+), 12 deletions(-)
> >  delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
> >  create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> >  create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
> >  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
> >
> > diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
> > deleted file mode 100644
> > index 053fea3..0000000
> > --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -CONFIG_HWMON=y
> > -CONFIG_SENSORS_NCT7904=y
> > -CONFIG_SENSORS_LM75=y
> > -CONFIG_EEPROM_AT24=y
> > diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> > index bb6f06c..6d7ae27 100644
> > --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> > +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> > @@ -1,2 +1,2 @@
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > -SRC_URI += "file://defconfig file://hwmon.cfg"
> > +SRC_URI += "file://defconfig"
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> > index 2594dec..63891b6 100644
> > --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> > +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> > @@ -1,4 +1 @@
> > -CONFIG_HWMON=y
> > -CONFIG_SENSORS_NCT7904=y
> > -CONFIG_EEPROM_AT24=y
> >  CONFIG_SENSORS_TMP421=y
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> > index 2594dec..63891b6 100644
> > --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> > +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> > @@ -1,4 +1 @@
> > -CONFIG_HWMON=y
> > -CONFIG_SENSORS_NCT7904=y
> > -CONFIG_EEPROM_AT24=y
> >  CONFIG_SENSORS_TMP421=y
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> > index 2594dec..498497e 100644
> > --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> > +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> > @@ -1,4 +1,3 @@
> > -CONFIG_HWMON=y
> >  CONFIG_SENSORS_NCT7904=y
> >  CONFIG_EEPROM_AT24=y
> >  CONFIG_SENSORS_TMP421=y
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> > new file mode 100644
> > index 0000000..f778394
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> > @@ -0,0 +1,3 @@
> > +CONFIG_SENSORS_NCT7904=y
> > +CONFIG_SENSORS_LM75=y
> > +CONFIG_EEPROM_AT24=y
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
> > new file mode 100644
> > index 0000000..9e74ab4
> > --- /dev/null
> > +++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
> > @@ -0,0 +1,2 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
> > +SRC_URI += "file://barreleye.cfg"
> > diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
> > new file mode 100644
> > index 0000000..ff2b329
> > --- /dev/null
> > +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
> > @@ -0,0 +1 @@
> > +CONFIG_HWMON=y
> > diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > index 47e3698..c0d8e38 100644
> > --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > @@ -6,6 +6,7 @@ KBRANCH ?= "dev-4.4"
> >  KCONFIG_MODE="--alldefconfig"
> >
> >  SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
> > +SRC_URI += "file://hwmon.cfg"
> >
> >  LINUX_VERSION ?= "4.4"
> >  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
> > --
> > 2.8.3
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc

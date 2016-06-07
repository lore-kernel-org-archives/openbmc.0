Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNxVV6PXNzDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 13:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=lYBpIA0C; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 92A0627B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465269230;
 bh=sWnKWiGvCC1bB7UEDZvo1WQ430XBQSBEvQC9gMrPMRc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=lYBpIA0CWKpqNtsUmb3aOddWzhV+lpA1uszDqLnbJOji1J93ZAo9jmMac4XNly3nq
 l63JYqLgPTj8E+okoJz0uoQfeT71/6FrxPxAZoYRLjgZ9fD2Xz3mmJmNPwoLpaIzzN
 F2crOA2cm/oZuwXIe5xxos9IrC20HKKY10DMAbkk=
Message-ID: <1465269220.30053.3.camel@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc 04/10] Remove duplicate kernel config fragments
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 06 Jun 2016 23:13:40 -0400
In-Reply-To: <CACPK8XdYTFA=covbyH9A7L+hxEHkPVsc4B7c9V0RUqn58tKaiw@mail.gmail.com>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-5-openbmc-patches@stwcx.xyz>
 <CACPK8XdYTFA=covbyH9A7L+hxEHkPVsc4B7c9V0RUqn58tKaiw@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Jun 2016 03:13:56 -0000

On Sun, 2016-06-05 at 11:35 -0500, Joel Stanley wrote:
> Hi Brad,
> 
> On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > Enable CONFIG_HWMON and nothing else in the base Phosphor layer.
> > Enable system specific modules in their respective layers.
> 
> I'd prefer these to be in a single configuration. I realise we don't
> use all these drivers in all of our platforms, but while the only
> deltas are small drivers it is easier to manage and test one kernel
> config.

Am I understanding correctly - in the defconfig?

That might work now, but I don't think it will scale for long.  And
if/when it doesn't, someone will have the chore of sorting out what
boards need what drivers, probably breaking one or two in the process.

Or did you mean the SOC layer has a defconfig, and then each board has
one fragment?  That could work.

> 
> Precedent for this is the OpenPower kernel configuration where we use
> the one configuration for may platforms that have different network
> and disk adaptors.
> 
> Cheers,
> 
> Joel
> 
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
> > index 09d40e5..b3aa704 100644
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
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

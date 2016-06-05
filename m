Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3yt4rtwzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 03:01:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GBjBAUja; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=X+0ORjol; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id v3so7454124qki.3
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MfOENmoa7Rcgq0K2kWXvuWUA+4w/XMkxJs46JPNPXyg=;
 b=GBjBAUja0l4Y4amNs0Q5tjag32Wfg7ATTZ+UARfCIyzSMPaNyKzu3KeGmOD8u1DtRA
 gIdCyf6O3axGeYpg8q4cs6MOa0P5oK8k2wnv6kM0Cg6GnQM5lyJzvUeAO+owcstM+4a/
 s0DSvFVwxnas8OhO9yYts7LfX2sgFtI/dWo/GVq39MY/rIH7pdt7TzrmVkeXfFRDLP+W
 esbliTvzZn/bjCSLDydj97CFt2cwUKK2GG7Upv/on/mMUhu/hgceODevnFbBt0W/4mR/
 ArIEb7nif+u4k1KIAGPNYPVhhoZ9/oVmvIWP+opU94FS285Hd+Aj9qn6bIYpNkf86vEs
 9ewQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MfOENmoa7Rcgq0K2kWXvuWUA+4w/XMkxJs46JPNPXyg=;
 b=X+0ORjolDHHbCPJMghEFvbrFnxHaWsuUhnKNY5YWH8dtrKvdQ3dfeYYV3BvbUUd/Wo
 FCvX3Vn+CzmS8dB0rMkAShSa5GQIDhIbGwgO3ifaZEWZIbxN01enRVz51zzkc7aCrXKt
 REhcYjlr7lkNYgL4yVmnbfMZEdI+iwsJ3WoLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MfOENmoa7Rcgq0K2kWXvuWUA+4w/XMkxJs46JPNPXyg=;
 b=NT7tLKjOSs60SF1KI9Yi2tgMBWJDMbLYSXklq/OH5z0iCSnWah/JF9z2UT0yFHep3A
 dy1tfkukCIhIzlM5/JrWYtWtVUH4QD75/LiwHN+LlG5fDP0oisoIJQQtKxkU/NKoczwL
 2QJNEItW+2JVpkr+7cIKO6bK647jctW0EUu0juv+CRGQXCusjpCe/oR8CMPnArm0UCps
 OjS/nIXUuNPASbKlLx7s03T2IM5lyZC6QiIgBlvz+/npymj9134nKIsqWrcMXeDcLc8P
 BZ7nir8Ej5KLUookKUSoh7G2BLLRtCdBHMIm7HXNqlULqJ2vOd8dpfd6K7vl3NHyeGY0
 xmgw==
X-Gm-Message-State: ALyK8tJlqnkO8n+jEUd6au9B0i6KAPKOjUVF+bkepHG7hE3m/wKrVhZVApISrkWxZ5y57X7N+UmDLHZpIzJe9w==
X-Received: by 10.55.203.202 with SMTP id u71mr12334911qkl.12.1465146115972;
 Sun, 05 Jun 2016 10:01:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 10:01:36 -0700 (PDT)
In-Reply-To: <20160604052039.6581-11-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-11-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 12:01:36 -0500
X-Google-Sender-Auth: FYmmRwb3_A2PRvfbQVWj63zhXZM
Message-ID: <CACPK8XfXJjhjfDTNYBeR9J+ZfSD0k=ySpJ=MMnBGrpr4W+CpiQ@mail.gmail.com>
Subject: Re: [PATCH openbmc 10/10] AST2500: Add AST2500 evaluation board layer
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sun, 05 Jun 2016 17:01:59 -0000

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> The AST2500 is an ARM SOC made by Aspeed.
>
> This layer is a stub; there are a couple missing bits of support
> from the kernel and u-boot.

Thanks, this is useful for my kernel bringup efforts.

I've got some comments below.

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  meta-openbmc-machines/meta-evb/conf/layer.conf     |   5 +
>  .../meta-evb/meta-evb-aspeed/conf/layer.conf       |   5 +
>  .../meta-evb-ast2500/conf/bblayers.conf.sample     |  27 +++
>  .../meta-evb-ast2500/conf/conf-notes.txt           |   2 +
>  .../meta-evb-ast2500/conf/layer.conf               |   5 +
>  .../meta-evb-ast2500/conf/local.conf.sample        | 245 +++++++++++++++++++++
>  .../meta-evb-ast2500/conf/machine/ast2500-evb.conf |   6 +
>  7 files changed, 295 insertions(+)
>  create mode 100644 meta-openbmc-machines/meta-evb/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
>
> diff --git a/meta-openbmc-machines/meta-evb/conf/layer.conf b/meta-openbmc-machines/meta-evb/conf/layer.conf
> new file mode 100644
> index 0000000..f8f2d0e
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb"
> +BBFILE_PATTERN_evb = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> new file mode 100644
> index 0000000..6d78f95
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb-aspeed"
> +BBFILE_PATTERN_evb-aspeed = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> new file mode 100644
> index 0000000..dee1fa1
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> @@ -0,0 +1,27 @@
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> +# changes incompatibly
> +LCONF_VERSION = "6"
> +
> +BBPATH = "${TOPDIR}"
> +BBFILES ?= ""
> +
> +BBLAYERS ?= " \
> +  ##OEROOT##/meta \
> +  ##OEROOT##/meta-yocto \
> +  ##OEROOT##/meta-phosphor \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> +  "
> +BBLAYERS_NON_REMOVABLE ?= " \
> +  ##OEROOT##/meta \
> +  ##OEROOT##/meta-yocto \
> +  ##OEROOT##/meta-phosphor \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> +  "
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> new file mode 100644
> index 0000000..9b3c01a
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> @@ -0,0 +1,2 @@
> +Common targets are:
> +     obmc-phosphor-image
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> new file mode 100644
> index 0000000..1c70336
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb-ast2500"
> +BBFILE_PATTERN_evb-ast2500 = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> new file mode 100644
> index 0000000..c080d0f
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> @@ -0,0 +1,245 @@
> +#
> +# This file is your local configuration file and is where all local user settings
> +# are placed. The comments in this file give some guide to the options a new user
> +# to the system might want to change but pretty much any configuration option can
> +# be set in this file. More adventurous users can look at local.conf.extended
> +# which contains other examples of configuration which can be placed in this file
> +# but new users likely won't need any of them initially.
> +#
> +# Lines starting with the '#' character are commented out and in some cases the
> +# default values are provided as comments to show people example syntax. Enabling
> +# the option is a question of removing the # character and making any change to the
> +# variable as required.
> +
> +#
> +# Machine Selection
> +#
> +# You need to select a specific machine to target the build with. There are a selection
> +# of emulated machines available which can boot and run in the QEMU emulator:
> +#
> +#MACHINE ?= "qemuarm"
> +#MACHINE ?= "qemuarm64"
> +#MACHINE ?= "qemumips"
> +#MACHINE ?= "qemuppc"
> +#MACHINE ?= "qemux86"
> +#MACHINE ?= "qemux86-64"
> +#
> +# There are also the following hardware board target machines included for
> +# demonstration purposes:
> +#
> +#MACHINE ?= "beaglebone"
> +#MACHINE ?= "genericx86"
> +#MACHINE ?= "genericx86-64"
> +#MACHINE ?= "mpc8315e-rdb"
> +#MACHINE ?= "edgerouter"

I'm not sure that there's any value in leaving this in. We can move to
just having the required bits in our local.conf.


> +#
> +# This sets the default machine to be qemux86 if no other machine is selected:
> +MACHINE ??= "ast2500-evb"
> +
> +#
> +# Where to place downloads
> +#
> +# During a first build the system will download many different source code tarballs
> +# from various upstream projects. This can take a while, particularly if your network
> +# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
> +# can preserve this directory to speed up this part of subsequent builds. This directory
> +# is safe to share between multiple builds on the same machine too.
> +#
> +# The default is a downloads directory under TOPDIR which is the build directory.
> +#
> +#DL_DIR ?= "${TOPDIR}/downloads"
> +
> +#
> +# Where to place shared-state files
> +#
> +# BitBake has the capability to accelerate builds based on previously built output.
> +# This is done using "shared state" files which can be thought of as cache objects
> +# and this option determines where those files are placed.
> +#
> +# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
> +# from these files if no changes were made to the configuration. If changes were made
> +# to the configuration, only shared state files where the state was still valid would
> +# be used (done using checksums).
> +#
> +# The default is a sstate-cache directory under TOPDIR.
> +#
> +#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
> +
> +#
> +# Where to place the build output
> +#
> +# This option specifies where the bulk of the building work should be done and
> +# where BitBake should place its temporary files and output. Keep in mind that
> +# this includes the extraction and compilation of many applications and the toolchain
> +# which can use Gigabytes of hard disk space.
> +#
> +# The default is a tmp directory under TOPDIR.
> +#
> +#TMPDIR = "${TOPDIR}/tmp"
> +
> +#
> +# Default policy config
> +#
> +# The distribution setting controls which policy settings are used as defaults.
> +# The default value is fine for general Yocto project use, at least initially.
> +# Ultimately when creating custom policy, people will likely end up subclassing
> +# these defaults.
> +#
> +DISTRO ?= "openbmc-phosphor"
> +# As an example of a subclass there is a "bleeding" edge policy configuration
> +# where many versions are set to the absolute latest code from the upstream
> +# source control systems. This is just mentioned here as an example, its not
> +# useful to most new users.
> +# DISTRO ?= "poky-bleeding"
> +
> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple package backends
> +# can be enabled at once and the first item listed in the variable will be used
> +# to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files
> +#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
> +#  - 'package_rpm' for rpm style packages
> +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
> +# We default to rpm:
> +PACKAGE_CLASSES ?= "package_rpm"
> +
> +#
> +# SDK/ADT target architecture
> +#
> +# This variable specifies the architecture to build SDK/ADT items for and means
> +# you can build the SDK packages for architectures other than the machine you are
> +# running the build on (i.e. building i686 packages on an x86_64 host).
> +# Supported values are i686 and x86_64
> +#SDKMACHINE ?= "i686"
> +
> +SANITY_TESTED_DISTROS_append ?= " RedHatEnterpriseWorkstation-6.*"

I don't think any of our developers care for the unsupported distro
warnings. I get them on my Ubuntu 16.04 system too. Can we just put
"*"?

> +
> +#
> +# Extra image configuration defaults
> +#
> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
> +# images. Some of these options are added to certain image types automatically. The
> +# variable can contain the following options:
> +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> +#                     (adds symbol information for debugging/profiling)
> +#  "dev-pkgs"       - add -dev packages for all installed packages
> +#                     (useful if you want to develop against libs in the image)
> +#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
> +#                     (useful if you want to run the package test suites)
> +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> +#  "tools-debug"    - add debugging tools (gdb, strace)
> +#  "eclipse-debug"  - add Eclipse remote debugging support
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
> +#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
> +#  "debug-tweaks"   - make an image suitable for development
> +#                     e.g. ssh root access has a blank password
> +# There are other application targets that can be used here too, see
> +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
> +# We default to enabling the debugging tweaks.
> +EXTRA_IMAGE_FEATURES = "debug-tweaks"
> +
> +#
> +# Additional image features
> +#
> +# The following is a list of additional classes to use when building images which
> +# enable extra features. Some available options which can be included in this variable
> +# are:
> +#   - 'buildstats' collect build statistics
> +#   - 'image-mklibs' to reduce shared library files size for an image
> +#   - 'image-prelink' in order to prelink the filesystem image
> +#   - 'image-swab' to perform host system intrusion detection
> +# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
> +# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
> +USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> +
> +#
> +# Runtime testing of images
> +#
> +# The build system can test booting virtual machine images under qemu (an emulator)
> +# after any root filesystems are created and run tests against those images. To
> +# enable this uncomment this line. See classes/testimage(-auto).bbclass for
> +# further details.
> +#TEST_IMAGE = "1"
> +#
> +# Interactive shell configuration
> +#
> +# Under certain circumstances the system may need input from you and to do this it
> +# can launch an interactive shell. It needs to do this since the build is
> +# multithreaded and needs to be able to handle the case where more than one parallel
> +# process may require the user's attention. The default is iterate over the available
> +# terminal types to find one that works.
> +#
> +# Examples of the occasions this may happen are when resolving patches which cannot
> +# be applied, to use the devshell or the kernel menuconfig
> +#
> +# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
> +# Note: currently, Konsole support only works for KDE 3.x due to the way
> +# newer Konsole versions behave
> +#OE_TERMINAL = "auto"
> +# By default disable interactive patch resolution (tasks will just fail instead):
> +PATCHRESOLVE = "noop"
> +
> +#
> +# Disk Space Monitoring during the build
> +#
> +# Monitor the disk space during the build. If there is less that 1GB of space or less
> +# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
> +# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
> +# of the build. The reason for this is that running completely out of space can corrupt
> +# files and damages the build in ways which may not be easily recoverable.
> +# It's necesary to monitor /tmp, if there is no space left the build will fail
> +# with very exotic errors.
> +BB_DISKMON_DIRS = "\
> +    STOPTASKS,${TMPDIR},1G,100K \
> +    STOPTASKS,${DL_DIR},1G,100K \
> +    STOPTASKS,${SSTATE_DIR},1G,100K \
> +    STOPTASKS,/tmp,100M,100K \
> +    ABORT,${TMPDIR},100M,1K \
> +    ABORT,${DL_DIR},100M,1K \
> +    ABORT,${SSTATE_DIR},100M,1K \
> +    ABORT,/tmp,10M,1K"
> +
> +#
> +# Shared-state files from other locations
> +#
> +# As mentioned above, shared state files are prebuilt cache data objects which can
> +# used to accelerate build time. This variable can be used to configure the system
> +# to search other mirror locations for these objects before it builds the data itself.
> +#
> +# This can be a filesystem directory, or a remote url such as http or ftp. These
> +# would contain the sstate-cache results from previous builds (possibly from other
> +# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
> +# cache locations to check for the shared objects.
> +# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
> +# at the end as shown in the examples below. This will be substituted with the
> +# correct path within the directory structure.
> +#SSTATE_MIRRORS ?= "\
> +#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
> +#file://.* file:///some/local/dir/sstate/PATH"

Should we make the shared state cache on openpower.xyz available via
http for developers to use?

> +
> +
> +#
> +# Qemu configuration
> +#
> +# By default qemu will build with a builtin VNC server where graphical output can be
> +# seen. The two lines below enable the SDL backend too. This assumes there is a
> +# libsdl library available on your build system.
> +PACKAGECONFIG_append_pn-qemu-native = " sdl"
> +PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
> +ASSUME_PROVIDED += "libsdl-native"

I don't think we need this. I believe we all enable the serial console
output to the console or a pty, so building in sdl is unnecessary.

Unrelated to this patch; are we building from our qemu tree?

> +
> +
> +# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
> +# track the version of this file when it was generated. This can safely be ignored if
> +# this doesn't mean anything to you.
> +CONF_VERSION = "1"
> +
> +# Set the root password to '0penBmc'
> +INHERIT += "extrausers"
> +
> +EXTRA_USERS_PARAMS = " \
> +  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
> +  "
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> new file mode 100644
> index 0000000..559e2b6
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> @@ -0,0 +1,6 @@
> +KMACHINE = "aspeed"
> +KERNEL_DEVICETREE = "${KMACHINE}-ast2500-evb.dtb"
> +
> +require conf/machine/include/ast2500.inc
> +require conf/machine/include/obmc-bsp-common.inc
> +require conf/machine/include/sample.inc
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

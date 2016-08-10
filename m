Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 434 seconds by postgrey-1.35 at bilbo;
 Wed, 10 Aug 2016 20:04:22 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b=P8V9FYVf; dkim-atps=neutral
Received: from forwardcorp1m.cmail.yandex.net (forwardcorp1m.cmail.yandex.net
 [5.255.216.198])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8RZZ3CN1zDqWf
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 20:04:22 +1000 (AEST)
Received: from mxbackcorp1h.mail.yandex.net (mxbackcorp1h.mail.yandex.net
 [IPv6:2a02:6b8:0:f05::301])
 by forwardcorp1m.cmail.yandex.net (Yandex) with ESMTP id A6D5F206D4
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 12:56:57 +0300 (MSK)
Received: from webcorp01g.yandex-team.ru (webcorp01g.yandex-team.ru
 [87.250.230.44])
 by mxbackcorp1h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 dmEe8gxLsT-uvqm4kSW; Wed, 10 Aug 2016 12:56:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1470823017; bh=0h7jyf0d09yFsuqzQH1M03djQcVBt/EEsJpeDheZs3g=;
 h=From:To:Subject:Message-Id:Date;
 b=P8V9FYVf/f0XaAc2TvpA3/BTj6YQkZGfQyso90TBaeSEHcdf7TyCwxUBfeZtBBp2N
 NJWEw0A9ldYkfuqZ+HmSyyTt2qU6Vwa6d30l+TvtMJx/zCYCFkAPjvB2xuyPVRR6Ar
 ZBqQ0+Hw8/p9dGID8lOdWzhF6rHJzmDP3+l26vOM=
Authentication-Results: mxbackcorp1h.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01g.yandex-team.ru with HTTP;
 Wed, 10 Aug 2016 12:56:57 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: OpenBMC on the OpenWRT
MIME-Version: 1.0
Message-Id: <97341470823017@webcorp01g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 10 Aug 2016 12:56:57 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
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
X-List-Received-Date: Wed, 10 Aug 2016 10:04:24 -0000

Hello everybody.

I'm working on a separate project for rack solution which utilize many portions of OpenBMC:

   https://github.com/ya-mouse/openbmc-target

As a system base we choose OpenWRT (flexible kernel-style configurations, package manager,
wide and experienced support for embedded systems with limited resources).
We still use old u-boot that came from OpenSource release of AMI SDK.
Have plans to move to the OpenBMC's version to start using of DTS.
And a few modifications over OpenBMC kernel tree:

1. I2C slave support for the aspeed adapter (it is ugly a bit).
2. I2C slave support for MUX switch (pca954x).
3. DTS overlay support ported from Raspberry Pi with userspace dtoverlay/dtparam/dtmerge tools to manage configs.
4. LuaJIT + Nginx as a HTTP API backend instead of python/micropython.
    We're on internal dissccusion of the API as a mainstream replacement for IPMB/IPMI.
    We use local memcached for fast serving data.
5. Transparent master/slave i2c based IPMB driver with OpenIPMI interface
    (works with regular ipmitool/freeipmi) to send requests to the Nodes.
    To work in a daemon mode kernel part of ipmi_msghandler should be modified a bit
    to receive incoming requests and store it separately while user (opener of the /dev/ipmiX)
    assigned by the outgoing SeqId. For unwanted (from current module's point of view)
    incoming packets there is currently no way to proper store such messages.

Just for reference.
We've compared performance of the several dynamic HTTP configurations such as
python/micropython/lua (LuCI) and embeeded lua within nginx and discover that last one has almost
maximum RPS comparing to the static pages serving.
Static is about 350 RPS while dynamic nginx+luajit with auth checking is at 220RPS.
Simple python's http serves at 40 RPS. LuCI variant is 4-6 RPS.
First request to authentication service occurs via https and the result stored in the
local nginx shared memory storage for the further use (configured for one minute).

-- 
Anton D. Kachalov

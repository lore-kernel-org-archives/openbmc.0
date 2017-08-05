Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPQtJ62LDzDqG5
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 11:19:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UhydT3xX"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id o86so13764315pfj.1
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 18:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sdkGc4k75VgiVHW6xXNjLtFvDG30FEjXFLCTkWTpWfs=;
 b=UhydT3xXyR6cDQktw4EsE7hzs7ACMjF35uWDHkkVaZA72b/0nnl4htHuYFwAQGAmGq
 jXeGHFihiB//uhnvhpZcQqLsFrk25Foclh1rlNs2aojjJWs+mzItYYgYiX2QeEC0h7ar
 HqFbzDBXw5mm4m0MoxnCIp8PNz34FjtdexkhdvYZ8ihCKiGMC1DGaci5vQUTJPFqk3eV
 l9u++v1ZYZ84Q+o9VQlIXo6GUevnkq02Be0v37vNl/l9LbiyrtpfJs1YLCRpNrT52ihz
 m/pMSn8LquijwwxHLAd1h06E/P2BWUXV6KYuwClRhGCdCvgmcK8XfwoCjZUukKewRsl7
 kCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sdkGc4k75VgiVHW6xXNjLtFvDG30FEjXFLCTkWTpWfs=;
 b=I+84e5K40CxhFeQ8w34c0vxPmMCYMP6UM6e51oN7uj8ZisuyVCI3K3gODE+HYV+RHb
 9eV3Llq+SamvEynSpIS0nKMoSuJAeLzTl5p/8yqvatURiFrc+mVMK8ma8CDnsXWT44PD
 IMRYMpAvRUZ4YUw1gePgwOTVqQc0GlxwnukySHRJxRkyxMZA+hNyTW8Jye5q5AdI2RcH
 a3evR5rfACunryaW4hEYcZSggWJc4OTsVHxgZT8YAOYIR9hXS7rUdh1pBPfMQzSsPjbS
 5iY/mZAvzHaudCVNnjydRUarMfOBHhD0LgQRwUAqyAvUiHSTMPf59xeGt8xYGo5garYn
 zE/A==
X-Gm-Message-State: AIVw112MgzE3Wvjx4KdDPYFdJTd29ZAOh2E3eDOEMEgXjVxVP1R2HSBc
 1BzDDoQ1cLAmP63U
X-Received: by 10.84.211.110 with SMTP id b101mr4987737pli.441.1501895941581; 
 Fri, 04 Aug 2017 18:19:01 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id x81sm5050721pfi.20.2017.08.04.18.18.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Aug 2017 18:19:00 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org, benjaminfair@google.com
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Fri,  4 Aug 2017 18:18:51 -0700
Message-Id: <20170805011855.1027-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
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
X-List-Received-Date: Sat, 05 Aug 2017 01:19:05 -0000
X-List-Received-Date: Sat, 05 Aug 2017 01:19:05 -0000

This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
same semantics as IPMI Block Transfer except it done over I2C.

For the OpenBMC people, this is based on an RFC:
https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html

The documentation discusses the reason for this in greater detail, suffice it to
say SSIF cannot be correctly implemented on some naive I2C devices. There are
some additional reasons why we don't like SSIF, but those are again covered in
the documentation for all those who are interested.

In addition, since I am adding both host side and BMC side support, I figured
that now is a good time to resolve the problem of where to put BMC side IPMI
drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
rest of the host side IPMI drivers, but I think it makes sense to put all of the
host side IPMI drivers in one directory and all of the BMC side drivers in
another, preferably in a way that does not effect all of the current OpenIPMI
users. I have not created a MAINTAINERS entry for the new directory yet, as I
figured there might be some discussion to be had about it.

I have tested this patchset on the Aspeed 2500 EVB.

Changes since previous update:
  - Cleaned up some documentation.
  - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
    directory.

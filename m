Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPNCx6tFnzDqb4
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 09:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ILBiuLVy"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id o86so13066653pfj.1
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6cTB5XzyTPNCP5zcFslj9uEoaLXmkXoN7fxaoHaQoDQ=;
 b=ILBiuLVyqiJ0nOLBrgNultjAGvMqUPG8yE+qd+pecdAB+l4RHuOHGL4+kYQlbG+kJD
 n2UuiRhUogBeHNhtyj/E8jhH8odDxoLRWzFAiBYXnVrcCORWnqtnmDtBanJeRUT4qzSw
 yNRSirjbl01mxjihB4gpmHyQP0xfF5TV391qiCnNQMrf0j6L7A1j0pUX0Im8m3AmDJVc
 mjHcA3j8cRbnxTXT8IC2LXUy5OmlFMuWGNMgb7Nz7Krgv3wtqG5IUM0e69oeX2U5TcsZ
 RuayF4rcFzbupYU2kMYS5B1Hw6iRyVoe8s0+JVi5SBapWjQsQJyeyQuu2E/lMHthrMCO
 tJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6cTB5XzyTPNCP5zcFslj9uEoaLXmkXoN7fxaoHaQoDQ=;
 b=LJiI/VTGHDq2tjgYeTrl3eOSZQy/q0bTBkYJdAaV2MK0xoxUCs+JpcF7A94i//Ts9f
 HrBo8xLXQvUNd6rdc8Fx35RHplAnxygd3vf3x03ID+gpZI0E4r+b4+rUKQffWFJG1KSl
 fHJOAaufVZbMd+A3Ai9IBn6oxSVrM2f4Oh9TOAxDTB/ocUYlnpq2705fExMNk8bl0fT3
 GtGDRtGjqNRJMI4M1s0Z7Id7g4A0730TL461fHU2lV6hP8MACztCmDBBjF81syUMHiM6
 wKhh5R82znjJeBrLf+3oSn/lLmfRqExt50bZajnUPfGVjYXfyjsdLvN5kZAP+izTvjN/
 a+Qg==
X-Gm-Message-State: AIVw11255St1Cm9BtD2uEU/7N+iNkbmPGVqCMMzlj/7CHOfrbYMM/sU1
 eILQS9zmQ3uo02/N
X-Received: by 10.84.209.237 with SMTP id y100mr4636927plh.6.1501888747916;
 Fri, 04 Aug 2017 16:19:07 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g1sm4976817pfk.92.2017.08.04.16.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Aug 2017 16:19:07 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 1/3] ipmi: bt-i2c: added documentation for bt-i2c drivers
Date: Fri,  4 Aug 2017 16:18:52 -0700
Message-Id: <20170804231854.19730-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
In-Reply-To: <20170804231854.19730-1-brendanhiggins@google.com>
References: <20170804231854.19730-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 04 Aug 2017 23:19:10 -0000

Added device tree binding documentation for ipmi-bt-i2c (host) and
ipmi-bmc-bt-i2c (BMC) and documentation for the Block Transfer over I2C
(bt-i2c) protocol.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/bt-i2c.txt                           | 121 +++++++++++++++++++++
 .../devicetree/bindings/ipmi/ipmi-bt-i2c.txt       |  21 ++++
 .../bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt          |  21 ++++
 3 files changed, 163 insertions(+)
 create mode 100644 Documentation/bt-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt

diff --git a/Documentation/bt-i2c.txt b/Documentation/bt-i2c.txt
new file mode 100644
index 000000000000..1b375359c519
--- /dev/null
+++ b/Documentation/bt-i2c.txt
@@ -0,0 +1,121 @@
+Linux Block Transfer over I2C (bt-i2c) interface description
+============================================================
+
+by Brendan Higgins <brendanhiggins@google.com> in 2016
+
+Introduction
+------------
+
+IPMI defines an interface for communication between a CPU, a BMC (Baseboard
+Management Controller), and sensors and various other peripherals. For a more
+complete description of IPMI please see:
+http://www.intel.com/content/www/us/en/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html
+
+IPMI defines a *common* message format, as in a set of fields that are common
+across all IPMI messages; they could be viewed as part of the framing
+information for an IPMI message. They include:
+
+	- netfn
+	- lun
+	- cmd
+
+netfn and cmd together define the type of the message; netfn can be viewed as a
+message class and cmd is a subtype of sorts. lun (logical unit number) is used
+for routing between messages between different interfaces. After the last field
+there is usually a variable length payload. Despite these common fields, the
+remainder of the framing varies widely between the IPMI defined hardware
+interfaces; some specify a length as part of the framing which is never more
+than a byte in length; others use a special signal to denote the end of message.
+Some IPMI hardware interfaces, the Block Transfer interface in particular,
+support a sequence number that aids in support of multiple in-flight IPMI
+messages.
+
+IPMI defines SSIF (SMBus System Interface) as the IPMI hardware interface for
+SMBus/I2C. It supports a maximum total message length of 255 bytes that is
+broken up across several SMBus block operations. It does not define a sequence
+field in the IPMI framing making it very difficult to support multiple in flight
+messages (it is also intentionally left out of the specification). SSIF also
+requires the slave device to NACK until it is ready to accept data (technically
+it only specifies that it may NACK until it is ready, but must NACK on attempted
+reads if it does not support SMBus Alert; however, this is an effective
+requirements since a slave device is supposed to start with SMBus Alert
+disabled); this again makes SSIF very difficult to support for some slave
+devices which may not support NACKing arbitrary messages; indeed, at the time of
+writing, the Linux I2C slave driver framework did not have support for sending
+NACKs.
+
+Block Transfer over I2C defines a new IPMI compatible interface that uses Block
+Transfer messages and semantics on top of plain old I2C; it does not assume that
+the I2C slave is capable of NACKing arbitrary messages; however, it is designed
+such that it could take advantage of SMBus Alert so that the master does not
+have to poll (the Linux I2C core slave mode does not currently support SMBus
+Alert, but a patch adding this support is currently on the way).
+
+Protocol Definition
+-------------------
+
+Block Transfer over I2C uses the IPMI defined Block Transfer message format; it
+supports variable length messages with a maximum length of 255 bytes (limited by
+the IPMI Block Transfer length byte).
+
+A Block Transfer over I2C Request is structured as follows:
+
+------------------------------------------------------------------------------------------------------
+| I2C start | slave address / RW bit unset | Block Transfer message | ... (another message or stop ) |
+------------------------------------------------------------------------------------------------------
+
+Multiple requests can be sent before any responses are received. Sequence
+numbers are to be handled by the users of the drivers; thus, no semantics are
+prescribed to their usage; however, the slave driver is required to buffer at
+least 256 requests before dropping requests; this can be used in conjunction
+with sequence numbers to prevent messages from being dropped by the slave.
+
+A Block Transfer over I2C Response is structured as follows:
+
+----------------------------------------------------------------------------------------------------
+| I2C start | slave address / RW bit set | Block Transfer message | ... (another message or stop ) |
+----------------------------------------------------------------------------------------------------
+
+Until a response is ready to send, the slave will respond only with zero bytes.
+If the slave receives a start or a stop before it was done sending a response,
+it will resend the entire response the next time a read is requested; in this
+way, an I2C master may poll for responses by reading a single byte until it is
+non-zero and then perform the read transaction shown above.
+
+In the future, it is planned that the slave will support using SMBus Alert to
+notify the master of an available response, but will never be required.
+
+Driver Interface
+----------------
+
+The slave side of the device file interface is modeled after ipmi-bmc-bt-i2c, a
+driver for the Aspeed 24xx/255xx IPMI Block Transfer controller.
+
+A read (request) should be large enough to fit a Block Transfer message
+(including the length byte) of 256 bytes; if the provided buffer is smaller, the
+message will be truncated.
+
+A write (response) must be no greater than the maximum valid length of a Block
+Transfer message (including the length byte), 256 bytes; if the provided buffer
+is larger, the write will fail with EINVAL. The driver also enforces a valid
+length byte which must contain the total length of the message not including the
+length byte; thus, the write will fail with EINVAL if the buffer length is less
+than the length field plus one. The driver will also only send length field plus
+one bytes.
+
+The slave device file interface also supports the poll system call; it will
+report when a request is available to read or it is ready to accept a response.
+
+The master side conforms to the OpenIPMI kernel framework.
+
+A read (response) should be large enough to fit a Block Transfer message
+(including the length byte) of 256 bytes; if the provided buffer is smaller, the
+message will be truncated.
+
+A write (request) must be no greater than the maximum valid length of a Block
+Transfer message (including the length byte), 256 bytes; if the provided buffer
+is larger, the write will fail with EFAULT. The driver also enforces a valid
+length byte which must contain the total length of the message not including the
+length byte; thus, the write will fail with EFAULT if the buffer length is less
+than the length field plus one. The driver will also only send length field plus
+one bytes.
diff --git a/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
new file mode 100644
index 000000000000..bd956f2805e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
@@ -0,0 +1,21 @@
+Device tree configuration for the ipmi-bt-i2c driver.
+
+Required Properties:
+- compatible 	: should be "ipmi-bt-i2c"
+- reg		: the I2C slave address of the ipmi-bmc-bt-i2c
+
+i2c0: i2c-bus@40 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x40 0x40>;
+	compatible = "aspeed,ast2400-i2c-bus";
+	clock-frequency = <100000>;
+	status = "disabled";
+	interrupts = <0>;
+	interrupt-parent = <&i2c>;
+
+	bt-i2c-master@41 {
+		compatible = "ipmi-bt-i2c";
+		reg = <0x41>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
new file mode 100644
index 000000000000..6e82693ee50e
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
@@ -0,0 +1,21 @@
+Device tree configuration for the ipmi-bmc-bt-i2c driver.
+
+Required Properties:
+- compatible 	: should be "ipmi-bmc-bt-i2c"
+- reg		: the I2C slave address of this driver.
+
+i2c0: i2c-bus@40 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x40 0x40>;
+	compatible = "aspeed,ast2400-i2c-bus";
+	clock-frequency = <100000>;
+	status = "disabled";
+	interrupts = <0>;
+	interrupt-parent = <&i2c>;
+
+	bt-i2c-slave@41 {
+		compatible = "ipmi-bmc-bt-i2c";
+		reg = <0x41>;
+	};
+};
-- 
2.14.0.rc1.383.gd1ce394fe2-goog

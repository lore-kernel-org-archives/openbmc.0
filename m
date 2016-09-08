Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com
 [IPv6:2607:f8b0:400e:c03::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVYPS0zcJzDrpY
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 07:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=TFUpNEM9; 
 dkim-atps=neutral
Received: by mail-pa0-x22e.google.com with SMTP id id6so20978552pad.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iagsykBz0JYHDNqsZ5P/TKuhOGSX1xmN8uJxU54g2K0=;
 b=TFUpNEM9sWbbpUGI5clfR1qvnPj7Mz8IkFfFbRVpejEUY2Fks9oaD5/rHKW8b1HBpZ
 1RqbAnvDdu0m/tRwSHRt81nYiEDeuPtdUsWvW04QknRxO3xB4lmVR1SG+G9O79nsBs+0
 HIs9q20bWOkjUz2SJRYZUoY+PyHzxP3NdXbjz45ENCwqQJefdFOiukdpYkpYFuRz78NT
 WNdZ1jKBn1E+YvgPhIZkYyNQAzl9dEIH+1dwYNFoDn00z2XmsSPxiqmQZbjv1KND5oFt
 zCPzV5KArIYna5A3l17KNNKsLNoAfA/nlrO/TyrZva58kWbA5NRi07YKVh9fdlDLo3N/
 aFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iagsykBz0JYHDNqsZ5P/TKuhOGSX1xmN8uJxU54g2K0=;
 b=laxRnGb9StxI4ulLMxBiJ9+IHQhRBPjHoYwbnsLMDRkIx3Ao/V9kap4hxglQEhwZmK
 wD7lGphAGx0yrzR3s+jxBcC7rlqlhh8XnJDfz8G7LVUMJiAsnK6PCLZu1HO+ldx0lJAe
 K0H05+aUF+TE+k/XqDJhucEmHVzbqosDLea1B0laO2gVE+ioYw07k+N1QJoa8Fk77PjJ
 SRz9C8VDq4/Zoi6WE4s/0+Zkshdfos+lfczMxbdt6s3Mv7Swa8GBQJaT8i9lpgZ9Rxr2
 6Gfw8Gffk0D5KwWWRuoQCRJuBjGYqIFESBRx/1PMA5VFNvFaIcsrY6H8/qTaVcAoAZfk
 rbqg==
X-Gm-Message-State: AE9vXwOBgreDBeloH6cgG2zcJosL6csKFMWgTIZF1kzCyMFq0Xp6bOrcEiPXhRGpqDlgE82V
X-Received: by 10.66.251.33 with SMTP id zh1mr142857pac.55.1473370152990;
 Thu, 08 Sep 2016 14:29:12 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id o80sm50037pfi.32.2016.09.08.14.29.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 08 Sep 2016 14:29:12 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC 2/2] misc: bt: added documentation for bt-i2c drivers
Date: Thu,  8 Sep 2016 14:28:50 -0700
Message-Id: <1473370130-26681-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 08 Sep 2016 21:29:16 -0000

Added device tree binding documentation for bt-i2c-master and
bt-i2c-slave and documentation for the Block Transfer over I2C (bt-i2c)
protocol.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 .../devicetree/bindings/misc/bt-i2c-master.txt     |  22 ++++
 .../devicetree/bindings/misc/bt-i2c-slave.txt      |  22 ++++
 Documentation/misc-devices/bt-i2c.txt              | 123 +++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/bt-i2c-master.txt
 create mode 100644 Documentation/devicetree/bindings/misc/bt-i2c-slave.txt
 create mode 100644 Documentation/misc-devices/bt-i2c.txt

diff --git a/Documentation/devicetree/bindings/misc/bt-i2c-master.txt b/Documentation/devicetree/bindings/misc/bt-i2c-master.txt
new file mode 100644
index 0000000..d418fe2
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/bt-i2c-master.txt
@@ -0,0 +1,22 @@
+Device tree configuration for the bt-i2c-master driver.
+
+Required Properties:
+- compatible 	: should be "bt-i2c-master"
+- reg		: the I2C slave address of the bt-i2c-slave
+
+i2c0: i2c-bus@40 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x40 0x40>;
+	compatible = "aspeed,ast2400-i2c-bus";
+	bus = <0>;
+	clock-frequency = <100000>;
+	status = "disabled";
+	interrupts = <0>;
+	interrupt-parent = <&i2c>;
+
+	bt-i2c-master@41 {
+		compatible = "bt-i2c-master";
+		reg = <0x41>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/misc/bt-i2c-slave.txt b/Documentation/devicetree/bindings/misc/bt-i2c-slave.txt
new file mode 100644
index 0000000..f4e67ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/bt-i2c-slave.txt
@@ -0,0 +1,22 @@
+Device tree configuration for the bt-i2c-slave driver.
+
+Required Properties:
+- compatible 	: should be "bt-i2c-slave"
+- reg		: the I2C slave address of this driver.
+
+i2c0: i2c-bus@40 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x40 0x40>;
+	compatible = "aspeed,ast2400-i2c-bus";
+	bus = <0>;
+	clock-frequency = <100000>;
+	status = "disabled";
+	interrupts = <0>;
+	interrupt-parent = <&i2c>;
+
+	bt-i2c-slave@41 {
+		compatible = "bt-i2c-slave";
+		reg = <0x41>;
+	};
+};
diff --git a/Documentation/misc-devices/bt-i2c.txt b/Documentation/misc-devices/bt-i2c.txt
new file mode 100644
index 0000000..15c6ee5
--- /dev/null
+++ b/Documentation/misc-devices/bt-i2c.txt
@@ -0,0 +1,123 @@
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
+The slave side of the device file interface is modeled after bt-host, a driver
+for the Aspeed 24xx/255xx IPMI Block Transfer controller.
+
+A read (request) should be large enough to fit a Block Transfer message
+(including the length byte) of 256 bytes; if the provided buffer is smaller, the
+message will be truncated.
+
+A write (response) must be no greater than the maximum valid length of a Block
+Transfer message (including the length byte), 256 bytes; if the provided buffer
+is larger, the write will fail with EFAULT. The driver also enforces a valid
+length byte which must contain the total length of the message not including the
+length byte; thus, the write will fail with EFAULT if the buffer length is less
+than the length field plus one. The driver will also only send length field plus
+one bytes.
+
+The slave device file interface also supports the poll system call; it will
+report when a request is available to read or it is ready to accept a response.
+
+The master side of the device file interface is pretty similar to the slave
+side, accept that it does not currently support poll (to be implemented along
+with SMBus Alert support).
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
-- 
2.8.0.rc3.226.g39d4020

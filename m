Return-Path: <clg@kaod.org>
Received: from 9.mo7.mail-out.ovh.net (9.mo7.mail-out.ovh.net [46.105.60.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fk1f0xzDvqT
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:21 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3BEB31E01F
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:19 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id C2AC4480075;
 Fri, 18 Nov 2016 15:26:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 27/38] hw/misc: add a TMP42{1,2,3} device model
Date: Fri, 18 Nov 2016 15:22:07 +0100
Message-Id: <1479478938-13267-28-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1119988936299547394
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:23 -0000

Largely inspired by the TMP105 temperature sensor, here is a model for
the TMP42{1,2,3} temperature sensors.

Specs can be found here :

	http://www.ti.com/lit/gpn/tmp421

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/Makefile.objs           |   1 +
 hw/misc/tmp421.c                | 400 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 402 insertions(+)
 create mode 100644 hw/misc/tmp421.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 6de3e16a3e11..e3ac9e0ec104 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -14,6 +14,7 @@ CONFIG_TWL92230=y
 CONFIG_TSC2005=y
 CONFIG_LM832X=y
 CONFIG_TMP105=y
+CONFIG_TMP421=y
 CONFIG_STELLARIS=y
 CONFIG_STELLARIS_INPUT=y
 CONFIG_STELLARIS_ENET=y
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 1a89615a6270..69610caa325d 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -1,6 +1,7 @@
 common-obj-$(CONFIG_APPLESMC) += applesmc.o
 common-obj-$(CONFIG_MAX111X) += max111x.o
 common-obj-$(CONFIG_TMP105) += tmp105.o
+common-obj-$(CONFIG_TMP421) += tmp421.o
 common-obj-$(CONFIG_ISA_DEBUG) += debugexit.o
 common-obj-$(CONFIG_SGA) += sga.o
 common-obj-$(CONFIG_ISA_TESTDEV) += pc-testdev.o
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
new file mode 100644
index 000000000000..0e310e0639e1
--- /dev/null
+++ b/hw/misc/tmp421.c
@@ -0,0 +1,400 @@
+/*
+ * Texas Instruments TMP421 temperature sensor.
+ *
+ * Copyright (c) 2016 IBM Corporation.
+ *
+ * Largely inspired by :
+ *
+ * Texas Instruments TMP105 temperature sensor.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/i2c/i2c.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+
+/* Manufacturer / Device ID's */
+#define TMP421_MANUFACTURER_ID          0x55
+#define TMP421_DEVICE_ID                0x21
+#define TMP422_DEVICE_ID                0x22
+#define TMP423_DEVICE_ID                0x23
+
+typedef struct DeviceInfo {
+    int model;
+    const char *name;
+} DeviceInfo;
+
+static const DeviceInfo devices[] = {
+    { TMP421_DEVICE_ID, "tmp421" },
+    { TMP422_DEVICE_ID, "tmp422" },
+    { TMP423_DEVICE_ID, "tmp423" },
+};
+
+typedef struct TMP421State {
+    /*< private >*/
+    I2CSlave i2c;
+    /*< public >*/
+
+    int16_t temperature[4];
+
+    uint8_t status;
+    uint8_t config[2];
+    uint8_t rate;
+
+    uint8_t len;
+    uint8_t buf[2];
+    uint8_t pointer;
+
+} TMP421State;
+
+typedef struct TMP421Class {
+    I2CSlaveClass parent_class;
+    DeviceInfo *dev;
+} TMP421Class;
+
+#define TYPE_TMP421 "tmp421-generic"
+#define TMP421(obj) OBJECT_CHECK(TMP421State, (obj), TYPE_TMP421)
+
+#define TMP421_CLASS(klass) \
+     OBJECT_CLASS_CHECK(TMP421Class, (klass), TYPE_TMP421)
+#define TMP421_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(TMP421Class, (obj), TYPE_TMP421)
+
+/* the TMP421 registers */
+#define TMP421_STATUS_REG               0x08
+#define    TMP421_STATUS_BUSY             (1 << 7)
+#define TMP421_CONFIG_REG_1             0x09
+#define    TMP421_CONFIG_RANGE            (1 << 2)
+#define    TMP421_CONFIG_SHUTDOWN         (1 << 6)
+#define TMP421_CONFIG_REG_2             0x0A
+#define    TMP421_CONFIG_RC               (1 << 2)
+#define    TMP421_CONFIG_LEN              (1 << 3)
+#define    TMP421_CONFIG_REN              (1 << 4)
+#define    TMP421_CONFIG_REN2             (1 << 5)
+#define    TMP421_CONFIG_REN3             (1 << 6)
+
+#define TMP421_CONVERSION_RATE_REG      0x0B
+#define TMP421_ONE_SHOT                 0x0F
+
+#define TMP421_RESET                    0xFC
+#define TMP421_MANUFACTURER_ID_REG      0xFE
+#define TMP421_DEVICE_ID_REG            0xFF
+
+#define TMP421_TEMP_MSB0                0x00
+#define TMP421_TEMP_MSB1                0x01
+#define TMP421_TEMP_MSB2                0x02
+#define TMP421_TEMP_MSB3                0x03
+#define TMP421_TEMP_LSB0                0x10
+#define TMP421_TEMP_LSB1                0x11
+#define TMP421_TEMP_LSB2                0x12
+#define TMP421_TEMP_LSB3                0x13
+
+static const int32_t mins[2] = { -40000, -55000 };
+static const int32_t maxs[2] = { 127000, 150000 };
+
+static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    TMP421State *s = TMP421(obj);
+    bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
+    int offset = ext_range * 64 * 256;
+    int64_t value;
+    int tempid;
+
+    if (sscanf(name, "temperature%d", &tempid) != 1) {
+        error_setg(errp, "error reading %s: %m", name);
+        return;
+    }
+
+    if (tempid >= 4 || tempid < 0) {
+        error_setg(errp, "error reading %s", name);
+        return;
+    }
+
+    value = ((s->temperature[tempid] - offset) * 1000 + 128) / 256;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+/* Units are 0.001 centigrades relative to 0 C.  s->temperature is 8.8
+ * fixed point, so units are 1/256 centigrades.  A simple ratio will do.
+ */
+static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    TMP421State *s = TMP421(obj);
+    Error *local_err = NULL;
+    int64_t temp;
+    bool ext_range = (s->config[0] & TMP421_CONFIG_RANGE);
+    int offset = ext_range * 64 * 256;
+    int tempid;
+
+    visit_type_int(v, name, &temp, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (temp >= maxs[ext_range] || temp < mins[ext_range]) {
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
+                   temp / 1000, temp % 1000);
+        return;
+    }
+
+    if (sscanf(name, "temperature%d", &tempid) != 1) {
+        error_setg(errp, "error reading %s: %m", name);
+        return;
+    }
+
+    if (tempid >= 4 || tempid < 0) {
+        error_setg(errp, "error reading %s", name);
+        return;
+    }
+
+    s->temperature[tempid] = (int16_t) ((temp * 256 - 128) / 1000) + offset;
+}
+
+static void tmp421_read(TMP421State *s)
+{
+    TMP421Class *sc = TMP421_GET_CLASS(s);
+
+    s->len = 0;
+
+    switch (s->pointer) {
+    case TMP421_MANUFACTURER_ID_REG:
+        s->buf[s->len++] = TMP421_MANUFACTURER_ID;
+        break;
+    case TMP421_DEVICE_ID_REG:
+        s->buf[s->len++] = sc->dev->model;
+        break;
+    case TMP421_CONFIG_REG_1:
+        s->buf[s->len++] = s->config[0];
+        break;
+    case TMP421_CONFIG_REG_2:
+        s->buf[s->len++] = s->config[1];
+        break;
+    case TMP421_CONVERSION_RATE_REG:
+        s->buf[s->len++] = s->rate;
+        break;
+    case TMP421_STATUS_REG:
+        s->buf[s->len++] = s->status;
+        break;
+
+        /* FIXME: check for channel enablement in config registers */
+    case TMP421_TEMP_MSB0:
+        s->buf[s->len++] = (((uint16_t) s->temperature[0]) >> 8);
+        s->buf[s->len++] = (((uint16_t) s->temperature[0]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_MSB1:
+        s->buf[s->len++] = (((uint16_t) s->temperature[1]) >> 8);
+        s->buf[s->len++] = (((uint16_t) s->temperature[1]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_MSB2:
+        s->buf[s->len++] = (((uint16_t) s->temperature[2]) >> 8);
+        s->buf[s->len++] = (((uint16_t) s->temperature[2]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_MSB3:
+        s->buf[s->len++] = (((uint16_t) s->temperature[3]) >> 8);
+        s->buf[s->len++] = (((uint16_t) s->temperature[3]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_LSB0:
+        s->buf[s->len++] = (((uint16_t) s->temperature[0]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_LSB1:
+        s->buf[s->len++] = (((uint16_t) s->temperature[1]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_LSB2:
+        s->buf[s->len++] = (((uint16_t) s->temperature[2]) >> 0) & 0xf0;
+        break;
+    case TMP421_TEMP_LSB3:
+        s->buf[s->len++] = (((uint16_t) s->temperature[3]) >> 0) & 0xf0;
+        break;
+    }
+}
+
+static void tmp421_reset(I2CSlave *i2c);
+
+static void tmp421_write(TMP421State *s)
+{
+    switch (s->pointer) {
+    case TMP421_CONVERSION_RATE_REG:
+        s->rate = s->buf[0];
+        break;
+    case TMP421_CONFIG_REG_1:
+        s->config[0] = s->buf[0];
+        break;
+    case TMP421_CONFIG_REG_2:
+        s->config[1] = s->buf[0];
+        break;
+    case TMP421_RESET:
+        tmp421_reset(I2C_SLAVE(s));
+        break;
+    }
+}
+
+static int tmp421_rx(I2CSlave *i2c)
+{
+    TMP421State *s = TMP421(i2c);
+
+    if (s->len < 2) {
+        return s->buf[s->len++];
+    } else {
+        return 0xff;
+    }
+}
+
+static int tmp421_tx(I2CSlave *i2c, uint8_t data)
+{
+    TMP421State *s = TMP421(i2c);
+
+    if (s->len == 0) {
+        /* first byte is the register pointer for a read or write
+         * operation */
+        s->pointer = data;
+        s->len++;
+    } else if (s->len == 1) {
+        /* second byte is the data to write. The device only supports
+         * one byte writes */
+        s->buf[0] = data;
+        tmp421_write(s);
+    }
+
+    return 0;
+}
+
+static void tmp421_event(I2CSlave *i2c, enum i2c_event event)
+{
+    TMP421State *s = TMP421(i2c);
+
+    if (event == I2C_START_RECV) {
+        tmp421_read(s);
+    }
+
+    s->len = 0;
+}
+
+static const VMStateDescription vmstate_tmp421 = {
+    .name = "TMP421",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(len, TMP421State),
+        VMSTATE_UINT8_ARRAY(buf, TMP421State, 2),
+        VMSTATE_UINT8(pointer, TMP421State),
+        VMSTATE_UINT8_ARRAY(config, TMP421State, 2),
+        VMSTATE_UINT8(status, TMP421State),
+        VMSTATE_UINT8(rate, TMP421State),
+        VMSTATE_INT16_ARRAY(temperature, TMP421State, 4),
+        VMSTATE_I2C_SLAVE(i2c, TMP421State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void tmp421_reset(I2CSlave *i2c)
+{
+    TMP421State *s = TMP421(i2c);
+    TMP421Class *sc = TMP421_GET_CLASS(s);
+
+    memset(s->temperature, 0, sizeof(s->temperature));
+    s->pointer = 0;
+
+    s->config[0] = 0; /* TMP421_CONFIG_RANGE */
+
+     /* resistance correction and channel enablement */
+    switch (sc->dev->model) {
+    case TMP421_DEVICE_ID:
+        s->config[1] = 0x1c;
+        break;
+    case TMP422_DEVICE_ID:
+        s->config[1] = 0x3c;
+        break;
+    case TMP423_DEVICE_ID:
+        s->config[1] = 0x7c;
+        break;
+    }
+
+    s->rate = 0x7;       /* 8Hz */
+    s->status = 0;
+}
+
+static int tmp421_init(I2CSlave *i2c)
+{
+    TMP421State *s = TMP421(i2c);
+
+    tmp421_reset(&s->i2c);
+
+    return 0;
+}
+
+static void tmp421_initfn(Object *obj)
+{
+    object_property_add(obj, "temperature0", "int",
+                        tmp421_get_temperature,
+                        tmp421_set_temperature, NULL, NULL, NULL);
+    object_property_add(obj, "temperature1", "int",
+                        tmp421_get_temperature,
+                        tmp421_set_temperature, NULL, NULL, NULL);
+    object_property_add(obj, "temperature2", "int",
+                        tmp421_get_temperature,
+                        tmp421_set_temperature, NULL, NULL, NULL);
+    object_property_add(obj, "temperature3", "int",
+                        tmp421_get_temperature,
+                        tmp421_set_temperature, NULL, NULL, NULL);
+}
+
+static void tmp421_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    TMP421Class *sc = TMP421_CLASS(klass);
+
+    k->init = tmp421_init;
+    k->event = tmp421_event;
+    k->recv = tmp421_rx;
+    k->send = tmp421_tx;
+    dc->vmsd = &vmstate_tmp421;
+    sc->dev = (DeviceInfo *) data;
+}
+
+static const TypeInfo tmp421_info = {
+    .name          = TYPE_TMP421,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(TMP421State),
+    .instance_init = tmp421_initfn,
+    .class_init    = tmp421_class_init,
+};
+
+static void tmp421_register_types(void)
+{
+    int i;
+
+    type_register_static(&tmp421_info);
+    for (i = 0; i < ARRAY_SIZE(devices); ++i) {
+        TypeInfo ti = {
+            .name       = devices[i].name,
+            .parent     = TYPE_TMP421,
+            .class_init = tmp421_class_init,
+            .class_data = (void *) &devices[i],
+        };
+        type_register(&ti);
+    }
+}
+
+type_init(tmp421_register_types)
-- 
2.7.4

Return-Path: <clg@kaod.org>
X-Greylist: delayed 666 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:36:12 AEDT
Received: from 2.mo7.mail-out.ovh.net (2.mo7.mail-out.ovh.net [87.98.143.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0t428RDzDvrX
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:36:11 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 59ED52045C
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:57 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 2301A480080;
 Fri, 18 Nov 2016 15:26:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 38/38] target-arm: Add VBAR support to ARM1176 CPUs
Date: Fri, 18 Nov 2016 15:22:18 +0100
Message-Id: <1479478938-13267-39-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1130684981795195650
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
X-List-Received-Date: Fri, 18 Nov 2016 14:36:12 -0000

ARM1176 CPUs support the Vector Base Address Register but currently,
qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
feature ARM_FEATURE_VBAR which is used for ARMv7 and ARM1176 CPUs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>

From Peter Maydell :

    Is it sufficient to set ARM_FEATURE_VBAR in the realizefn
    if FEATURE_V7 or FEATURE_EL3? (watch out that realizefn
    may change the value of the FEATURE_EL3 bit partway down
    so you'd need to do the check there) ?

    We implement VBAR in v7-without-EL3 even though architecturally
    it should only exist in v7-with-EL3 because we have some
    legacy board models which we implement as without-EL3 but
    where the guest (Linux) assumes it's running on a with-EL3
    CPU in NS mode. I'd rather we stick to the architectural
    definition for 1176 if we can rather than expanding the
    "things we do which aren't architectural" set if there's
    no legacy config that requires it. (If it is necessary
    to define it for 1176 always then that's OK, I'd just
    prefer not to unless we know we have to.)

    We should probably also have a brief comment noting that
    we define VBAR always in v7, even though architecturally
    it doesn't exist in non-EL3 configs, for the benefit of
    legacy board models.

    (In v8 VBAR is required whether EL3 is implemented or not.)

    thanks
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target-arm/cpu.c    |  2 ++
 target-arm/cpu.h    |  1 +
 target-arm/helper.c | 18 ++++++++++++------
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 99f0dbebb9f6..f8566deb0939 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -589,6 +589,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_LPAE);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
+        set_feature(env, ARM_FEATURE_VBAR);
         set_feature(env, ARM_FEATURE_VAPA);
         set_feature(env, ARM_FEATURE_THUMB2);
         set_feature(env, ARM_FEATURE_MPIDR);
@@ -911,6 +912,7 @@ static void arm1176_initfn(Object *obj)
 
     cpu->dtb_compatible = "arm,arm1176";
     set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VBAR);
     set_feature(&cpu->env, ARM_FEATURE_VFP);
     set_feature(&cpu->env, ARM_FEATURE_VAPA);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849ed65e..c6841df8afb9 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1125,6 +1125,7 @@ enum arm_features {
     ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
     ARM_FEATURE_PMU, /* has PMU support */
+    ARM_FEATURE_VBAR, /* has cp15 VBAR (ARM1176) */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target-arm/helper.c b/target-arm/helper.c
index b5b65caadf8a..9bfffa4a4b60 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1252,12 +1252,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write },
-    { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .writefn = vbar_write,
-      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
-                             offsetof(CPUARMState, cp15.vbar_ns) },
-      .resetvalue = 0 },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_R, .readfn = ccsidr_read, .type = ARM_CP_NO_RAW },
@@ -1411,6 +1405,15 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetvalue = 0 },
     REGINFO_SENTINEL
 };
+static const ARMCPRegInfo vbar_cp_reginfo[] = {
+    { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
+      .access = PL1_RW, .writefn = vbar_write,
+      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
+                             offsetof(CPUARMState, cp15.vbar_ns) },
+      .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
 
 #ifndef CONFIG_USER_ONLY
 
@@ -4506,6 +4509,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_V6K)) {
         define_arm_cp_regs(cpu, v6k_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_VBAR)) {
+        define_arm_cp_regs(cpu, vbar_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7MP) &&
         !arm_feature(env, ARM_FEATURE_MPU)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
-- 
2.7.4

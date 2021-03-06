/*
 * Agora Digital Solutions Inc.
 *************************************************************************************
 * Copyright 2020 Agora Digital Solutions Inc.

 * All rights reserved in Agora Digital Solutions Inc. authored and generated code (including the selection and arrangement of the source code base regardless of the authorship of individual files), but not including any copyright interest(s) owned by a third party related to source code or object code authored or generated by non- Agora Digital Solutions Inc. personnel.
 * Any use, disclosure and/or reproduction of source code is prohibited unless in compliance with the AGORA SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT.
 *
 */

#include "gtest/gtest.h"
#include "JSerializer.hpp"
#include "FlowSensor.hpp"

namespace{

class FlowSensorTest : public testing::Test {

protected:

    virtual void SetUp() {

    }

    virtual void TearDown() {

    }

    IAppManager* testModuleMgr;
    IBusClient* busClient;

};

}

TEST_F(FlowSensorTest, ModuleTest1) {

  std::string mod_name;


  hbm::JSerializer* config_serializer = new hbm::JSerializer("../module.json");
  ASSERT_TRUE( NULL != config_serializer );
  config_serializer->GetValue("Name", mod_name);

  testModuleMgr = (IAppManager *) CModuleComponent::Create(mod_name, false);
  EXPECT_TRUE( testModuleMgr != NULL );

}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

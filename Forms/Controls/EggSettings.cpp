/*
 * This file is part of PokéFinder
 * Copyright (C) 2017-2020 by Admiral_Fish, bumba, and EzPzStreamz
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#include "EggSettings.hpp"
#include "ui_EggSettings.h"
#include <Core/Enum/Game.hpp>
#include <Core/Util/Translator.hpp>

EggSettings::EggSettings(QWidget *parent) : QWidget(parent), ui(new Ui::EggSettings)
{
    ui->setupUi(this);
    setupModels();
}

EggSettings::~EggSettings()
{
    delete ui;
}

void EggSettings::setup(Game version)
{
    if ((version & Game::RSE) || (version & Game::FRLG))
    {
        ui->labelAbility->setVisible(false);
        ui->labelItem->setVisible(version & Game::Emerald);
        ui->labelNature->setVisible(version & Game::Emerald);

        ui->comboBoxParentAAbility->setVisible(false);
        ui->comboBoxParentBAbility->setVisible(false);
        ui->comboBoxParentAItem->setVisible(version & Game::Emerald);
        ui->comboBoxParentBItem->setVisible(version & Game::Emerald);
        ui->comboBoxParentANature->setVisible(version & Game::Emerald);
        ui->comboBoxParentBNature->setVisible(version & Game::Emerald);

        ui->checkBoxNidoranVolbeat->setVisible(false);
        ui->checkBoxMasuada->setVisible(false);
    }
    else if ((version & Game::DPPt) || (version & Game::HGSS))
    {
        ui->labelAbility->setVisible(false);
        ui->labelItem->setVisible(false);
        ui->labelNature->setVisible(false);

        ui->comboBoxParentAAbility->setVisible(false);
        ui->comboBoxParentBAbility->setVisible(false);
        ui->comboBoxParentAItem->setVisible(false);
        ui->comboBoxParentBItem->setVisible(false);
        ui->comboBoxParentANature->setVisible(false);
        ui->comboBoxParentBNature->setVisible(false);

        ui->checkBoxNidoranVolbeat->setVisible(false);
    }
    else if ((version & Game::BW) || (version & Game::BW2))
    {
        ui->comboBoxParentAItem->addItem(tr("Power Weight"));
        ui->comboBoxParentAItem->addItem(tr("Power Bracer"));
        ui->comboBoxParentAItem->addItem(tr("Power Belt"));
        ui->comboBoxParentAItem->addItem(tr("Power Lens"));
        ui->comboBoxParentAItem->addItem(tr("Power Band"));
        ui->comboBoxParentAItem->addItem(tr("Power Anklet"));

        ui->comboBoxParentBItem->addItem(tr("Power Weight"));
        ui->comboBoxParentBItem->addItem(tr("Power Bracer"));
        ui->comboBoxParentBItem->addItem(tr("Power Belt"));
        ui->comboBoxParentBItem->addItem(tr("Power Lens"));
        ui->comboBoxParentBItem->addItem(tr("Power Band"));
        ui->comboBoxParentBItem->addItem(tr("Power Anklet"));

        ui->comboBoxParentAAbility->addItem("H");
        ui->comboBoxParentBAbility->addItem("H");
    }
}

Daycare EggSettings::getDaycareSettings() const
{
    QVector<u8> parent1IVs = { static_cast<u8>(ui->spinBoxParentAHP->value()),  static_cast<u8>(ui->spinBoxParentAAtk->value()),
                               static_cast<u8>(ui->spinBoxParentADef->value()), static_cast<u8>(ui->spinBoxParentASpA->value()),
                               static_cast<u8>(ui->spinBoxParentASpD->value()), static_cast<u8>(ui->spinBoxParentASpe->value()) };

    QVector<u8> parent2IVs = { static_cast<u8>(ui->spinBoxParentBHP->value()),  static_cast<u8>(ui->spinBoxParentBAtk->value()),
                               static_cast<u8>(ui->spinBoxParentBDef->value()), static_cast<u8>(ui->spinBoxParentBSpA->value()),
                               static_cast<u8>(ui->spinBoxParentBSpD->value()), static_cast<u8>(ui->spinBoxParentBSpe->value()) };

    u8 parent1Ability = ui->comboBoxParentAAbility->currentIndex();
    u8 parent2Ability = ui->comboBoxParentBAbility->currentIndex();

    u8 parent1Gender = ui->comboBoxParentAGender->currentIndex();
    u8 parent2Gender = ui->comboBoxParentBGender->currentIndex();

    u8 parent1Item = ui->comboBoxParentAItem->currentIndex();
    u8 parent2Item = ui->comboBoxParentBItem->currentIndex();

    u8 parent1Nature = ui->comboBoxParentANature->currentIndex();
    u8 parent2Nature = ui->comboBoxParentBNature->currentIndex();

    bool masuada = ui->checkBoxMasuada->isChecked();
    bool nidoranVolbeat = ui->checkBoxNidoranVolbeat->isChecked();

    return Daycare(parent1IVs, parent2IVs, parent1Ability, parent2Ability, parent1Gender, parent2Gender, parent1Item, parent2Item,
                   parent1Nature, parent2Nature, masuada, nidoranVolbeat);
}

bool EggSettings::compatibleParents() const
{
    u8 parent1 = ui->comboBoxParentAGender->currentIndex();
    u8 parent2 = ui->comboBoxParentBGender->currentIndex();

    // Male/Female
    if ((parent1 == 0 && parent2 == 1) || (parent1 == 1 && parent2 == 0))
    {
        return true;
    }

    // Ditto/Female
    if ((parent1 == 3 && parent2 == 1) || (parent1 == 1 && parent2 == 3))
    {
        return true;
    }

    // Male/Ditto
    if ((parent1 == 0 && parent2 == 3) || (parent1 == 3 && parent2 == 0))
    {
        return true;
    }

    // Genderless/Ditto
    if ((parent1 == 2 && parent2 == 3) || (parent1 == 3 && parent2 == 2))
    {
        return true;
    }

    return false;
}

bool EggSettings::reorderParents()
{
    u8 parent1 = ui->comboBoxParentAGender->currentIndex();
    u8 parent2 = ui->comboBoxParentBGender->currentIndex();

    // Female/Male -> Male/Female
    bool flag = parent1 == 1 && parent2 == 0;

    // Female/Ditto -> Ditto/Female
    flag |= parent1 == 1 && parent2 == 3;

    // Ditto/Male -> Male/Ditto
    flag |= parent1 == 3 && parent2 == 0;

    // Ditto/Genderless -> Genderless/Ditto
    flag |= parent1 == 3 && parent2 == 2;

    if (flag)
    {
        Daycare daycare = getDaycareSettings();

        ui->spinBoxParentAHP->setValue(daycare.getParentIV(1, 0));
        ui->spinBoxParentAAtk->setValue(daycare.getParentIV(1, 1));
        ui->spinBoxParentADef->setValue(daycare.getParentIV(1, 2));
        ui->spinBoxParentASpA->setValue(daycare.getParentIV(1, 3));
        ui->spinBoxParentASpD->setValue(daycare.getParentIV(1, 4));
        ui->spinBoxParentASpe->setValue(daycare.getParentIV(1, 5));
        ui->comboBoxParentAAbility->setCurrentIndex(daycare.getParentAbility(1));
        ui->comboBoxParentAGender->setCurrentIndex(daycare.getParentGender(1));
        ui->comboBoxParentAItem->setCurrentIndex(daycare.getParentItem(1));
        ui->comboBoxParentANature->setCurrentIndex(daycare.getParentNature(1));

        ui->spinBoxParentBHP->setValue(daycare.getParentIV(0, 0));
        ui->spinBoxParentBAtk->setValue(daycare.getParentIV(0, 1));
        ui->spinBoxParentBDef->setValue(daycare.getParentIV(0, 2));
        ui->spinBoxParentBSpA->setValue(daycare.getParentIV(0, 3));
        ui->spinBoxParentBSpD->setValue(daycare.getParentIV(0, 4));
        ui->spinBoxParentBSpe->setValue(daycare.getParentIV(0, 5));
        ui->comboBoxParentBAbility->setCurrentIndex(daycare.getParentAbility(0));
        ui->comboBoxParentBGender->setCurrentIndex(daycare.getParentGender(0));
        ui->comboBoxParentBItem->setCurrentIndex(daycare.getParentItem(0));
        ui->comboBoxParentBNature->setCurrentIndex(daycare.getParentNature(0));
    }

    return flag;
}

void EggSettings::setupModels()
{
    ui->comboBoxParentANature->addItems(Translator::getNatures());
    ui->comboBoxParentBNature->addItems(Translator::getNatures());

    for (u8 i = 0; i < 3; i++)
    {
        ui->comboBoxParentAGender->addItem(Translator::getGender(i));
        ui->comboBoxParentBGender->addItem(Translator::getGender(i));
    }
    ui->comboBoxParentAGender->addItem(Translator::getSpecies(132));
    ui->comboBoxParentBGender->addItem(Translator::getSpecies(132));

    ui->comboBoxParentAAbility->addItem("1");
    ui->comboBoxParentAAbility->addItem("2");

    ui->comboBoxParentBAbility->addItem("1");
    ui->comboBoxParentBAbility->addItem("2");

    ui->comboBoxParentAItem->addItem("None");
    ui->comboBoxParentAItem->addItem("Everstone");

    ui->comboBoxParentBItem->addItem("None");
    ui->comboBoxParentBItem->addItem("Everstone");

    connect(ui->checkBoxShowInheritance, &QCheckBox::clicked, this, &EggSettings::toggleInheritance);
}

void EggSettings::showInheritance(bool checked)
{
    emit toggleInheritance(checked);
}
